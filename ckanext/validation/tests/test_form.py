import json
import io
import mock

import pytest
from bs4 import BeautifulSoup
from six import BytesIO, ensure_binary

from ckantoolkit import check_ckan_version
from ckan.tests.factories import Sysadmin, Dataset
from ckan.tests.helpers import (
    FunctionalTestBase, call_action
)
from ckan.tests import helpers

from ckanext.validation.tests.helpers import (
    VALID_CSV, mock_uploads
)

if check_ckan_version('2.9'):
    NEW_RESOURCE_URL = '/dataset/{}/resource/new'
    EDIT_RESOURCE_URL = '/dataset/{}/resource/{}/edit'
else:
    NEW_RESOURCE_URL = '/dataset/new_resource/{}'
    EDIT_RESOURCE_URL = '/dataset/{}/resource_edit/{}'

def _get_resource_new_page_as_sysadmin(app, id):
    env = _get_extra_env_as_sysadmin()
    response = app.get(
        url=NEW_RESOURCE_URL.format(id),
        extra_environ=env,
    )
    return response


def _get_resource_update_page_as_sysadmin(app, id, resource_id):
    env = _get_extra_env_as_sysadmin()
    response = app.get(
        url=EDIT_RESOURCE_URL.format(id, resource_id),
        extra_environ=env,
    )
    return response


def _get_extra_env_as_sysadmin():
    user = Sysadmin()
    return {'REMOTE_USER': user['name'].encode('ascii')}


def _get_response_body(response):
    if hasattr(response, 'text'):
        return response.text
    else:
        return response.body


def _get_form(response):
    soup = BeautifulSoup(_get_response_body(response), 'html.parser')
    return soup.find('form', id='resource-edit')


def _post(app, url, data, resource_id='', upload=None):
    args = []
    env = _get_extra_env_as_sysadmin()
    if upload and check_ckan_version('2.9'):
        for entry in upload:
            data[entry[0]] = (BytesIO(entry[2]), entry[1])
    
    # from the form
    data['id'] = resource_id
    data['save'] = ''

    if check_ckan_version('2.9'):
        kwargs = {
            'url': url,
            'data': data,
            'extra_environ': env
        }
    
    else:
        args.append(url)
        kwargs = {
            'params': data,
            'extra_environ': env,
            'upload_files': upload
        }

    return app.post(*args, **kwargs)


@pytest.mark.usefixtures("clean_db", "validation_setup")
class TestResourceSchemaForm(object):

    def test_resource_form_includes_json_fields(self, app):
        dataset = Dataset()

        response = _get_resource_new_page_as_sysadmin(app, dataset['id'])
        form = _get_form(response)

        assert form.find("input", attrs={'name': 'schema'})
        assert form.find("textarea", attrs={'name': 'schema_json'})
        assert form.find("input", attrs={'name': 'schema_url'})

    @pytest.mark.usefixtures("clean_db", "validation_setup")
    def test_resource_form_create(self, app):
        dataset = Dataset()

        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        json_value = json.dumps(value)

        params = {
                'package_id': dataset['id'],
                'url': 'https://example.com/data.csv',
                'schema': json_value,
            }

        _post(app, NEW_RESOURCE_URL.format(dataset['id']), params)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    def test_resource_form_create_json(self, app):
        dataset = Dataset()

        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        json_value = json.dumps(value)

        params = {
                'package_id': dataset['id'],
                'url': 'https://example.com/data.csv',
                'schema_json': json_value,
            }

        _post(app, NEW_RESOURCE_URL.format(dataset['id']), params)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    @mock_uploads
    def test_resource_form_create_upload(self, mock_open):
        dataset = Dataset()
        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        json_value = ensure_binary(json.dumps(value), encoding='utf-8')

        upload = ('schema_upload', 'schema.json', json_value)
        params = {
                'url': 'https://example.com/data.csv',
            }
        app = helpers._get_test_app()
        _post(app, NEW_RESOURCE_URL.format(dataset['id']),
              params, upload=[upload])

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    def test_resource_form_create_url(self, app):
        dataset = Dataset()

        value = 'https://example.com/schemas.json'

        params = {
                'package_id': dataset['id'],
                'url': 'https://example.com/data.csv',
                'schema_json': value,
            }

        _post(app, NEW_RESOURCE_URL.format(dataset['id']), params)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    def test_resource_form_update(self, app):
        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        dataset = Dataset(
            resources=[{
                'url': 'https://example.com/data.csv',
                'schema': value
            }]
        )

        response = _get_resource_update_page_as_sysadmin(
            app, dataset['id'], dataset['resources'][0]['id'])
        form = _get_form(response)

        assert form.find(attrs={'name': "schema"})['value'] == \
            json.dumps(value, indent=None)

        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'},
                {'name': 'date'}
            ]
        }

        json_value = json.dumps(value)

        resource_id = dataset['resources'][0]['id']

        params = {
            'url': 'https://example.com/data.csv',
            'schema': json_value
        }

        _post(app, EDIT_RESOURCE_URL.format(dataset['id'], resource_id),
              params, resource_id=resource_id)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    def test_resource_form_update_json(self, app):
        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        dataset = Dataset(
            resources=[{
                'url': 'https://example.com/data.csv',
                'schema': value
            }]
        )

        response = _get_resource_update_page_as_sysadmin(
            app, dataset['id'], dataset['resources'][0]['id'])
        form = _get_form(response)

        assert form.find(attrs={'name': "schema_json"}).text == \
            json.dumps(value, indent=2)

        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'},
                {'name': 'date'}
            ]
        }

        json_value = json.dumps(value)

        resource_id = dataset['resources'][0]['id']

        params = {
            'url': 'https://example.com/data.csv',
            'schema_json': json_value
        }

        _post(app, EDIT_RESOURCE_URL.format(dataset['id'], resource_id),
              params, resource_id=resource_id)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    def test_resource_form_update_url(self, app):
        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        dataset = Dataset(
            resources=[{
                'url': 'https://example.com/data.csv',
                'schema': value
            }]
        )

        response = _get_resource_update_page_as_sysadmin(
            app, dataset['id'], dataset['resources'][0]['id'])
        form = _get_form(response)

        assert form.find(attrs={'name': "schema_json"}).text ==\
            json.dumps(value, indent=2)

        value = 'https://example.com/schema.json'

        resource_id = dataset['resources'][0]['id']

        params = {
            'url': 'https://example.com/data.csv',
            'schema_url': value
        }

        _post(app, EDIT_RESOURCE_URL.format(dataset['id'], resource_id),
              params, resource_id=resource_id)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value

    def test_resource_form_update_upload(self, app):
        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'}
            ]
        }
        dataset = Dataset(
            resources=[{
                'url': 'https://example.com/data.csv',
                'schema': value
            }]
        )

        response = _get_resource_update_page_as_sysadmin(
            app, dataset['id'], dataset['resources'][0]['id'])
        form = _get_form(response)

        assert form.find(attrs={'name': "schema_json"}).text == \
            json.dumps(value, indent=2)

        value = {
            'fields': [
                {'name': 'code'},
                {'name': 'department'},
                {'name': 'date'}
            ]
        }

        json_value = ensure_binary(json.dumps(value), encoding='utf-8')
        resource_id = dataset['resources'][0]['id']

        upload = ('schema_upload', 'schema.json', json_value)
        params = {
            'url': 'https://example.com/data.csv',
        }

        _post(app, EDIT_RESOURCE_URL.format(dataset['id'], resource_id),
              params, resource_id=resource_id, upload=[upload])

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['schema'] == value


@pytest.mark.usefixtures("clean_db", "validation_setup")
class TestResourceValidationOptionsForm(object):

    def test_resource_form_includes_json_fields(self, app):
        dataset = Dataset()

        response = _get_resource_new_page_as_sysadmin(app, dataset['id'])
        form = _get_form(response)

        assert form.find("textarea", attrs={'name': 'validation_options'})

    def test_resource_form_create(self, app):
        dataset = Dataset()

        value = {
            'delimiter': ';',
            'headers': 2,
            'skip_rows': ['#'],
        }
        json_value = json.dumps(value)
        params = {
                'url': 'https://example.com/data.csv',
                'validation_options': json_value,
            }

        _post(app, NEW_RESOURCE_URL.format(dataset['id']), params)

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['validation_options'] == value

    def test_resource_form_update(self, app):
        value = {
            'delimiter': ';',
            'headers': 2,
            'skip_rows': ['#'],
        }

        dataset = Dataset(
            resources=[{
                'url': 'https://example.com/data.csv',
                'validation_options': value
            }]
        )

        response = _get_resource_update_page_as_sysadmin(
            app, dataset['id'], dataset['resources'][0]['id'])
        form = _get_form(response)

        assert form.find("textarea",
                         attrs={'name': 'validation_options'}).text ==\
            json.dumps(value, indent=2, sort_keys=True)

        value = {
            'delimiter': ';',
            'headers': 2,
            'skip_rows': ['#'],
            'skip_tests': ['blank-rows'],
        }

        json_value = json.dumps(value)

        params = {
            'url': 'https://example.com/data.csv',
            'validation_options': json_value
        }
        resource_id = dataset['resources'][0]['id']

        _post(app, EDIT_RESOURCE_URL.format(dataset['id'], resource_id),
              params, resource_id=resource_id)
        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['validation_options'] == value


@pytest.mark.usefixtures("clean_db", "validation_setup")
class TestResourceValidationOnCreateForm(FunctionalTestBase):

    @classmethod
    def _apply_config_changes(cls, cfg):
        cfg['ckanext.validation.run_on_create_sync'] = True

    def setup(self):
        pass

    @mock_uploads
    def test_resource_form_create_valid(self, mock_open):
        dataset = Dataset()

        upload = ('upload', 'valid.csv', VALID_CSV)

        valid_stream = io.BufferedReader(io.BytesIO(VALID_CSV))

        params = {
            'url': 'https://example.com/data.csv'
        }
        app = helpers._get_test_app()
        with mock.patch('io.open', return_value=valid_stream):
            _post(app, NEW_RESOURCE_URL.format(dataset['id']),
                  params, upload=[upload])

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['validation_status'] == 'success'
        assert 'validation_timestamp' in dataset['resources'][0]

    # @mock_uploads
    # def test_resource_form_create_invalid(self, mock_open, app):
    #     user = Sysadmin()
    #     org = Organization(user=user)
    #     dataset = Dataset(owner_org=org['id'])

    #     upload = ('upload', 'invalid.csv', INVALID_CSV)

    #     invalid_stream = io.BufferedReader(io.BytesIO(INVALID_CSV))

    #     params = {
    #         'url': 'https://example.com/data.csv'
    #     }

    #     with mock.patch('io.open', return_value=invalid_stream):
    #         response = _post(app, NEW_RESOURCE_URL.format(dataset['id']),
    #                          params, upload=[upload])
    #     print(response.body)
    #     dataset = call_action('package_show', id=dataset['id'])
    #     print(dataset)
    #     assert 'validation' in response.body
    #     assert 'missing-value' in response.body
    #     assert 'Row 2 has a missing value in column 4' in response.body


@pytest.mark.usefixtures("clean_db", "validation_setup")
class TestResourceValidationOnUpdateForm(FunctionalTestBase):

    @classmethod
    def _apply_config_changes(cls, cfg):
        cfg['ckanext.validation.run_on_update_sync'] = True

    def setup(self):
        self.app = helpers._get_test_app()

    @mock_uploads
    def test_resource_form_update_valid(self, mock_open):

        dataset = Dataset(resources=[
            {
                'url': 'https://example.com/data.csv'
            }
        ])

        upload = ('upload', 'valid.csv', VALID_CSV)

        valid_stream = io.BufferedReader(io.BytesIO(VALID_CSV))

        params = {
            'url': 'https://example.com/data.csv'
        }
        resource_id = dataset['resources'][0]['id']

        with mock.patch('io.open', return_value=valid_stream):
            _post(self.app, EDIT_RESOURCE_URL.format(dataset['id'], resource_id),
                  params, resource_id=resource_id, upload=[upload])

        dataset = call_action('package_show', id=dataset['id'])

        assert dataset['resources'][0]['validation_status'] == 'success'
        assert 'validation_timestamp' in dataset['resources'][0]

    # @mock_uploads
    # def test_resource_form_update_invalid(self, mock_open, app):

    #     dataset = Dataset(resources=[
    #         {
    #             'url': 'https://example.com/data.csv'
    #         }
    #     ])

    #     response = _get_resource_update_page_as_sysadmin(
    #         app, dataset['id'], dataset['resources'][0]['id'])

    #     upload = ('upload', 'invalid.csv', INVALID_CSV)
    #     resource_id = dataset['resources'][0]['id']
    #     params = {}
    #     invalid_stream = io.BufferedReader(io.BytesIO(INVALID_CSV))

    #     with mock.patch('builtins.open', return_value=invalid_stream):
    #         response = _post(app, EDIT_RESOURCE_URL.format(dataset['id'],
    #                                                        resource_id),
    #                          params, resource_id=resource_id, upload=[upload])
    #         print(response)
    #     print(dir(response))
    #     assert 'validation' in response.body
    #     assert 'missing-value' in response.body
    #     assert 'Row 2 has a missing value in column 4' in response.body


# @pytest.mark.usefixtures("clean_db", "validation_setup")
# class TestResourceValidationFieldsPersisted(FunctionalTestBase):

#     @classmethod
#     def _apply_config_changes(cls, cfg):
#         cfg['ckanext.validation.run_on_create_sync'] = True
#         cfg['ckanext.validation.run_on_update_sync'] = True

#     def setup(self):
#         pass

#     @mock_uploads
#     def test_resource_form_fields_are_persisted(self, mock_open, app):

#         upload = MockFieldStorage(io.BytesIO(VALID_CSV), 'valid.csv')

#         valid_stream = io.BufferedReader(BytesIO(VALID_CSV))

#         dataset = Dataset()
#         with mock.patch('io.open', return_value=valid_stream):
#             resource = call_action(
#                 'resource_create',
#                 package_id=dataset['id'],
#                 validation_status='success',
#                 validation_timestamp=datetime.datetime.now().isoformat(),
#                 upload=upload,
#                 url='data.csv')

#         assert 'validation_status' in resource
#         assert resource['validation_status'] == 'success'
#         assert resource.get('description') is None

#         params = {
#             'description': 'test desc'
#         }

#         dataset = call_action('package_show', id=dataset['id'])

#         _post(app, EDIT_RESOURCE_URL.format(dataset['id'], resource['id']),
#               params, resource_id=resource['id'])

#         dataset = call_action('package_show', id=dataset['id'])

#         assert dataset['resources'][0]['validation_status'] == 'success'
#         assert 'validation_timestamp' in dataset['resources'][0]
#         assert dataset['resources'][0]['description'] == 'test desc'

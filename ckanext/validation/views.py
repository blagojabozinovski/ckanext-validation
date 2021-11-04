import logging

from flask import Blueprint

from ckantoolkit import (
    c, NotAuthorized, ObjectNotFound,
    abort, _, render, get_action)


log = logging.getLogger(__name__)
validation = Blueprint(u'validation', __name__)


def read(id, resource_id):
    try:
        validation = get_action(u'resource_validation_show')(
            {u'user': c.user},
            {u'resource_id': resource_id})

        resource = get_action(u'resource_show')(
            {u'user': c.user},
            {u'id': resource_id})

        dataset = get_action(u'package_show')(
            {u'user': c.user},
            {u'id': resource[u'package_id']})

        # Needed for core resource templates
        c.package = c.pkg_dict = dataset
        c.resource = resource

        return render(u'validation/validation_read.html', extra_vars={
            u'validation': validation,
            u'resource': resource,
            u'pkg_dict': dataset,
        })

    except NotAuthorized:
        abort(403, _(u'Unauthorized to read this validation report'))
    except ObjectNotFound:

        abort(404, _(u'No validation report exists for this resource'))


validation.add_url_rule(u'/dataset/<id>/resource/<resource_id>/validation', view_func=read)


def get_blueprints():
    return [validation]

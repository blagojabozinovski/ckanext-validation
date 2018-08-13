��    s      �              L  6   M  �   �  �   3     �     �  A  �  ]  ;
  Z  �  &  �       	   (     2  M   8     �     �     �  j   �  d   $  �   �  �   #  �   �  �   �     d     |     �     �     �  )   �     �     �               &     2  
   ?  T   J  )   �  V   �           )     1     >     C     H     [     u     �     �     �  -   �     �            �        �     �  >   �  $   7  6   \  L   �     �     �     �            #   /  J   S  `   �  I   �  I   I  J   �  9   �  	      "  ^  8  x   �  {     �   �  {     �   �  {      s   �   
   �   3   	!  2   =!  .  p!  r  �"  O  $  =  b%  :  �&  1  �'  b  )  \  p*  �   �+  @  �,     �-  4   �-  +   .     <.     N.  ,   U.     �.  
   �.     �.     �.     �.     �.     �.     �.     �.     �.  	   �.     /     /  }  /  V   �0  ]  �0    H2     T3     q3  y  �3  �  6  �  �8  B  Y;     �=     �=     �=  }   �=     a>  $   }>  @   �>  �   �>  �   �?    c@  y  �A  H  �B  �  FD  =   	F  !   GF     iF     �F  $   �F  ]   �F  -   G     IG  (   hG  )   �G  )   �G     �G     H  �   H  J   �H  �   �H     �I     �I  #   �I     �I     �I  -   �I  A   J  +   OJ  ?   {J  '   �J  '   �J  W   K  '   cK    �K  ,   �M  [  �M  1   "O  2   TO  u   �O  6   �O  O   4P  �   �P     "Q  4   AQ     vQ  $   �Q     �Q  /   �Q  }   R  �   �R  �   KS  �   �S  h   wT  ^   �T  �  ?U    +W  �  CY  �   �[  �   �\  �   b]  �   ,^  �   �^  �   �_  �   c`     �`  M   a  Z   _a    �a  �  �c  �  wf  j  i  o  �k  ]  �m  �  Np  �  �r  [  �u  ~  �v  ,   xy  w   �y  x   z  6   �z     �z  z   �z  .   [{     �{  @   �{  9   �{     %|     D|     ^|     o|     �|     �|     �|     �|     �|   
Please report this to https://github.com/chjj/marked. 
There are validation issues with this file, please see the
<a {params}>report</a> for details. Once you have resolved the issues,
click the button below to replace the file.  You can pass a JSON object of validation options. See <a href="https://github.com/frictionlessdata/ckanext-validation#validation-options">here</a> for more information.  valid table(s)  warning(s) A column in the header row is missing a value. Column names should be provided.

 How it could be resolved:
 - Add the missing column name to the first row of the data source.
 - If the first row starts with, or ends with a comma, remove it.
 - If this error should be ignored disable `blank-header` check in {validator}. A lenght of this field value should be greater or equal than schema constraint value.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove or refine the `minimumLength` constraint in the schema.
 - If this error should be ignored disable `minimum-length-constraint` check in {validator}. A lenght of this field value should be less or equal than schema constraint value.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove or refine the `maximumLength` constraint in the schema.
 - If this error should be ignored disable `maximum-length-constraint` check in {validator}. Based on the schema there should be a header that is missing in the first row of the data source.

 How it could be resolved:
 - Add the missing column to the data source or remove the extra field from the schema
 - If this error should be ignored disable `missing-header` check in {validator}. Blank Header Blank Row Clear Column {column_number} is a required field, but row {row_number} has no value Data Schema Data Schema URL Data Validation Report Data reading error because of HTTP error.

 How it could be resolved:
 - Fix url link if it's not correct. Data reading error because of IO error.

 How it could be resolved:
 - Fix path if it's not correct. Data reading error because of an encoding problem.

 How it could be resolved:
 - Fix data source if it's broken.
 - Set correct encoding in {validator}. Data reading error because of incorrect format.

 How it could be resolved:
 - Fix data format (e.g. change file extension from `txt` to `csv`).
 - Set correct format in {validator}. Data reading error because of incorrect scheme.

 How it could be resolved:
 - Fix data scheme (e.g. change scheme from `ftp` to `http`).
 - Set correct scheme in {validator}. Data reading error because of not supported or inconsistent contents.

 How it could be resolved:
 - Fix data contents (e.g. change JSON data to array or arrays/objects).
 - Set correct source settings in {validator}. Data validation unknown Duplicate Header Duplicate Row Duration Encoding Error Enter manually a Table Schema JSON object Enumerable Constraint Error details Error during validation Extra Header Extra Value Format Error HTTP Error Header in column {column_number} doesn't match field name {field_name} in the schema Header in column {column_number} is blank Header in column {column_number} is duplicated to header in column(s) {column_numbers} IO Error Invalid Invalid data JSON Link Maximum Constraint Maximum Length Constraint Minimum Constraint Minimum Length Constraint Missing Header Missing Value No validation report exists for this resource Non-Matching Header One of the data source headers doesn't match the field name defined in the schema.

 How it could be resolved:
 - Rename header in the data source or field in the schema
 - If this error should be ignored disable `non-matching-header` check in {validator}. Pattern Constraint Provided schema is not valid.

 How it could be resolved:
 - Update schema descriptor to be a valid descriptor
 - If this error should be ignored disable schema cheks in {validator}. Required Constraint Resource was not found. Row {row_number} has a missing value in column {column_number} Row {row_number} is completely blank Row {row_number} is duplicated to row(s) {row_numbers} Rows {row_numbers} has unique constraint violation in column {column_number} Scheme Error Show next 10 rows Source Error Success details Table Schema Error Table Schema error: {error_message} The data source could not be successfully decoded with {encoding} encoding The data source has not supported or has inconsistent contents; no tabular data can be extracted The data source is in an unknown format; no tabular data can be extracted The data source is in an unknown scheme; no tabular data can be extracted The data source returned an HTTP error with a status code of {status_code} The data source returned an IO Error of type {error_type} The exact same data has been seen in another row.

 How it could be resolved:
 - If some of the data is incorrect, correct it.
 - If the whole row is an incorrect duplicate, remove it.
 - If this error should be ignored disable `duplicate-row` check in {validator}. The first row of the data source contains header that doesn't exist in the schema.

 How it could be resolved:
 - Remove the extra column from the data source or add the missing field to the schema
 - If this error should be ignored disable `extra-header` check in {validator}. The value does not match the schema type and format for this field.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If this value is correct, adjust the type and/or format.
 - To ignore the error, disable the `type-or-format-error` check in {validator}. In this case all schema checks for row values will be ignored. The value {value} in row {row_number} and column {column_number} does not conform to the given enumeration: {constraint} The value {value} in row {row_number} and column {column_number} does not conform to the maximum constraint of {constraint} The value {value} in row {row_number} and column {column_number} does not conform to the maximum length constraint of {constraint} The value {value} in row {row_number} and column {column_number} does not conform to the minimum constraint of {constraint} The value {value} in row {row_number} and column {column_number} does not conform to the minimum length constraint of {constraint} The value {value} in row {row_number} and column {column_number} does not conform to the pattern constraint of {constraint} The value {value} in row {row_number} and column {column_number} is not type {field_type} and format {field_format} There are  There is a missing header in column {column_number} There is an extra header in column {column_number} This field is a required field, but it contains no value.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove the `required` constraint from the schema.
 - If this error should be ignored disable `required-constraint` check in {validator}. This field is a unique field but it contains a value that has been used in another row.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then the values in this column are not unique. Remove the `unique` constraint from the schema.
 - If this error should be ignored disable `unique-constraint` check in {validator}. This field value should be equal to one of the values in the enumeration constraint.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove or refine the `enum` constraint in the schema.
 - If this error should be ignored disable `enumerable-constraint` check in {validator}. This field value should be greater or equal than constraint value.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove or refine the `minimum` constraint in the schema.
 - If this error should be ignored disable `minimum-constraint` check in {validator}. This field value should be less or equal than constraint value.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove or refine the `maximum` constraint in the schema.
 - If this error should be ignored disable `maximum-constraint` check in {validator}. This field value should conform to constraint pattern.

 How it could be resolved:
 - If this value is not correct, update the value.
 - If value is correct, then remove or refine the `pattern` constraint in the schema.
 - If this error should be ignored disable `pattern-constraint` check in {validator}. This row has less values compared to the header row (the first row in the data source). A key concept is that all the rows in tabular data must have the same number of columns.

 How it could be resolved:
 - Check data is not missing a comma between the values in this row.
 - If this error should be ignored disable `missing-value` check in {validator}. This row has more values compared to the header row (the first row in the data source). A key concept is that all the rows in tabular data must have the same number of columns.

 How it could be resolved:
 - Check data has an extra comma between the values in this row.
 - If this error should be ignored disable `extra-value` check in {validator}. This row is empty. A row should contain at least one value.

 How it could be resolved:
 - Delete the row.
 - If this error should be ignored disable `blank-row` check in {validator}. Two columns in the header row have the same value. Column names should be unique.

 How it could be resolved:
 - Add the missing column name to the first row of the data.
 - If the first row starts with, or ends with a comma, remove it.
 - If this error should be ignored disable `duplicate-header` check in {validator}. Type or Format Error URL for a Data Schema file available on the Internet Unauthorized to read this validation report Unique Constraint Upload Upload a Data Schema file from your computer Uploaded Data Schema Valid data Validation Report Validation timestamp Warning details data error failure invalid schema structure success unknown Project-Id-Version: ckanext-validation 0.0.4
Report-Msgid-Bugs-To: EMAIL@ADDRESS
POT-Creation-Date: 2018-08-13 10:53+0200
PO-Revision-Date: 2018-08-07 14:19+0200
Last-Translator: 
Language: mk
Language-Team: mk <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 
Ве молиме пријавете го ова на https://github.com/chjj/marked. 
Постојат грешки при валидација на оваа датотека, Ве молиме погледнете го
<a {params}>извештајот</a> за детали. Штом ги поправивте грешките,
кликнете на подолното копче за да ја заменете датотеката.  Можете да ставите JSON објект кој содржи опции за валидација. Погледнете <a href="https://github.com/frictionlessdata/ckanext-validation#validation-options">тука</a> за повеќе информации.  валидни табели  предупредувањa Колоната во насловот на редот недостига вредност. Имињата на колоните треба да бидат дадени.

  Како може да се реши:
  - Додајте име на колона што недостасува во првиот ред од изворот на податоци.
  - Ако првиот ред започнува, или завршува со запирка, отстранете го.
  - Ако оваа грешка треба да се игнорира, оневозможете го "blank-header" проверете во {validator}. Должина на ова поле вредност треба да биде поголема или еднаква од ограниченатавредност на шемата.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранете ја или поправете ограничувањето за `minimumLength` во шемата.
- Ако оваа грешка треба да се игнорира, оневозможете го `minimum-length-constraint` во полето за избор во {validator}. Должина на оваа вредност на полето треба да биде помала или еднаква од ограниченатавредност на шемата.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранете ја или поправете го органичувањето за `maximumLength` во шемата.
- Ако оваа грешка треба да се игнорира, оневозможете `maximum-length-constraint` во полето за избор во {validator}. Врз основа на шемата треба да има заглавие кое недостасува во првиот ред од изворот на податоци.

Како може да се реши:
- Додајте ја колоната што недостасува во изворот на податоци или отстранете го дополнителното поле од шемата
- Ако оваа грешка треба да се игнорира, оневозможете го `missing-header` полето за избор во {validator}. Празно заглавие Празен ред Отстранете Колоната {column_number} е задолжително поле, но редот {row_number} нема вредност Податочна шема URL до податочна шема Извештај од валидација на податоци Грешка при читање податоци поради HTTP грешка.

Како може да се реши:
 - Поправете ја URL врската ако не е точна. Грешка при читање податоци поради IO грешка.

Како може да се реши:
 - Поправете ја патеката ако не е точна. Грешка при читање податоци поради неточно кодирање.

Како може да се реши:
- Поправете извор на податоци ако е скршен
- Поставете го точното кодирање во {validator}. Грешка при читање податоци поради неточен формат.

Како може да се реши:
- Поправете формат на податоци (на пример, променете ја екстензијата на датотеката од `txt` во `csv`).
- Поставете го точниот формат во {validator}. Грешка при читање податоци поради неточна шема.

Како може да се реши:
- Поправете шема на податоци (на пример, променете ја шемата од `ftp` на `http`).
- Поставете ја точната шема во {validator}. Грешка при читање податоци поради недозволени или неконзистентни содржини.

Како може да се реши:
- Поправете ги содржините на податоци (на пример, промена на JSON податоци во низа или низи/објекти).
- Поставете ги точните извори на поставки во {validator}. Непозната валидација на податоци Дупликат заглавие Дупликат ред Времетраење Грешка при кодирање Внесете рачно JSON објект која содржи табеларна шема Избројливо ограничување Детали за грешка Грешка при валидација Дополнително заглавие Дополнителна вредност Грешка во формат HTTP грешка Заглавјето во колоната {column_number} не се совпаѓа со името на полето {field_name} во шемата Заглавието во колоната {column_number} е празно Заглавието во колоната {column_number} се дуплицира во заглавието во колоните {column_numbers} IO грешка Невалидни Невалидни податоци JSON Линк Максимално ограничување Ограничување на максимална должина Минимално ограничување Ограничување на минимална должина Недостасува заглавие Недостасува вредност Не постои извештај од валидација за овој ресурс Несоодветно заглавје Еден од заглавијата на изворот на податоци не се совпаѓа со името на полето дефинирано во шемата.

  Како може да се реши:
  - Преименувај го заглавието во изворот на податоци или полето во шемата
  - Ако оваа грешка треба да се игнорира, оневозможете ја `non-matching-header` полето за избор во {validator}. Ограничување во моделот Овој ред е празен. Еден ред треба да содржи најмалку една вредност

Како да се реши:
- Избришете го редот.
- Ако оваа грешка треба да се игнорира, оневозможете го `blank-row` полето за избор во {validator}. Задолжително ограничување Ресурсот не беше пронајден. Редот {row_number} има вредност која недостасува во колоната {column_number} Редот {row_number} е целосно празен Редот {row_number} е дупликат на редовите {row_numbers} Редовите {row_numbers} имаат единствена прекршување на ограничувањата во колоната {column_number} Грешка на шемата Прикажи ги следните 10 редови Изворна грешка Детали за валидност Грешка во шемата Грешка во шемата: {error_message} Изворот на податоци не може успешно да се декодира со {encoding} кодирање Изворот на податоци не поддржа или има неконзистентни содржини; табеларните податоци не можат да се извадат Изворот на податоци е во непознат формат; не може да се извадат табеларни податоци Изворот на податоци е во непозната шема; не може да се извадат табеларни податоци Изворот на податоци врати HTTP-грешка со статус код {status_code} Изворот на податоци вратил IO грешка од типот {error_type} Точно истите податоци може да се видат во друг ред.

  Како може да се реши:
  - Ако некои од податоците не се точни, исправте ги.
  - Ако целиот ред е погрешен дупликат, отстранете го.
  - Ако оваа грешка треба да се игнорира, оневозможете го `duplicate-row` полето за избор во {validator}. Првиот ред од изворот на податоци содржи заглавие кое не постои во шемата.

 Како може да се реши:
- Отстранете ја дополнителната колона од изворот на податоци или додадете го полето што недостасува во шемата
- Ако оваа грешка треба да се игнорира, оневозможете "extra-header" полето за избор во (validator). Вредноста не се совпаѓа со типот на шема и формат за ова поле.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако оваа вредност е точна, прилагодете го типот и/или форматот.
- За да ја игнорирате грешката, оневозможете го `type-or-format-error` полето за избор во {validator}. Во овој случај сите проверки на шемата за вредностите на редот ќе бидат игнорирани. Вредноста {value} во ред {row_number} и колона {column_number} неодговара на даденото избројување од: {constraint} Вредноста {вредност} во ред {ред_број} и колона {column_number} неодговара на максималното ограничување на {ограничување} Вредноста {value} во ред {row_number} и колона {column_number} неодговара на максималното ограничување на должината од {constraint} Вредноста {value} во ред {row_number} и колона {column_number} неодговара на минималното ограничување од {constraint} Вредноста {value} во ред {row_number} и колона {column_number} неодговара на минималното ограничување на должината од {constraint} Вредноста {value} во ред {row_number} и колона {column_number} не е во согласност со ограничувањето за  моделот од {constraint} Вредноста {value} во редот {row_number} и колоната {column_number} не е од тип {field_type} и формат {field_format} Постојат  Недостасува заглавие во колоната {column_number} Постои дополнително заглавие во колната {column_number} Ова поле е задолжително поле, но не содржи вредност.

 Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранувајте го ограниченото `required` од шемата.
- Ако оваа грешка треба да се игнорира, оневозможете "required-constraint" полето за избор во {validator}. Ова поле е единствено поле, но содржи вредност што се користела во друг ред.

 Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш вредностите во оваа колона не се единствени. Отстранете го ограничувањето на `unique` од шемата.
- Ако оваа грешка треба да се игнорира, оневозможете ја `unique-constraint` полето за избор во {validator}. Оваа вредност на полето треба да биде еднаква на една од вредностите во ограничувањето во избројувањето.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранете ја или поправете го `enum` ограничувањето во шемата.
- Ако оваа грешка треба да се игнорира, оневозможете го `enumerable-constraint` полето за избор во {validator}. Оваа вредност на полето треба да биде поголема или еднаква од ограничувањето.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранете ја или поправете го `minimum` ограничувањето вошемата.
- Ако оваа грешка треба да се игнорира, оневозможете го `minimum-constraint` полето за избор во {validator}. Оваа вредност на полето треба да биде помала или еднаква од ограничувањето.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранете ја или поправете го `максимум` ограничувањето вошемата.
- Ако оваа грешка треба да се игнорира, оневозможете го `maximum-constraint` полето за избор во {validator}. Оваа вредност на полето треба да одговара на шаблонот за ограничување.

Како може да се реши:
- Ако оваа вредност не е точна, ажурирајте ја вредноста.
- Ако вредноста е точна, тогаш отстранете ја или променете го `pattern` ограничувањето во шемата.
- Ако оваа грешка треба да се игнорира оневозможете го `pattern-constraint` полето за избор во {validator}. Овој ред има помалку вредности во споредба со заглавието (првиот ред во изворот на податоци). Клучниот концепт е дека сите редови во табеларните податоци мора да имаат ист број на колони.

Како може да се реши:
- Проверка на податоци не недостасува запирка меѓу вредностите во овој ред.
- Ако оваа грешка треба да се игнорира оневозможете "missing-value" полето за избор во {validator}. Овој ред има повеќе вредности во споредба со заглавието (првиот ред во изворот на податоци). Клучниот концепт е дека сите редови во табеларните податоци мора да имаат ист број на колони.

Како може да се реши:
- Проверката на податоците има дополнителна запирка меѓу вредностите во овој ред.
- Ако оваа грешка треба да се игнорира, оневозможете го "extra-value" полето за избор {validator}. Овој ред е празен. Еден ред треба да содржи најмалку една вредност

Како да се реши:
- Избришете го редот.
- Ако оваа грешка треба да се игнорира, оневозможете го `blank-row` полето за избор во {validator}. Две колони во насловот на редот имаат иста вредност. Имињата на колоните треба да бидат единствени.

  Како може да се реши:
  - Додајте име на колона што недостасува во првиот ред од податоците.
  - Ако првиот ред започнува, или завршува со запирка, отстранете ја.
  - Ако оваа грешка треба да се игнорира, оневозможете го "duplicate-header" полето за избор {validator}. Грешка во тип или формат Линк до датотека која содржи податочна шема достапна на Интернет Не сте авторизирани за да го погледнете извештајот од валидација. Ограничување за единственост Прикачете Прикачете датотека од вашиот компјутер која содржи податочна шема Прикачена податочна шема Валидни податоци Извештај од валидација на податоци Временска ознака од валидација Детали за грешка податоците се погрешни погрешни невалидни шема структура валидни непознати 
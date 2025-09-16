# pt-archiver-fix

This is a quick fix for: https://forums.percona.com/t/when-pt-archiver-archives-mysql-json-fields-garbled-characters-appear/39307

The Chinese character strings in the json type fields in Mysql cannot be saved correctly to the file, and garbled characters will appear.

Mysql中json类型的字段中文字符串无法正确的保存到文件中，会出现乱码。

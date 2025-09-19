# pt-archiver-fix

官方的`pt-archiver`脚本中，将Mysql数据表里含有中文内容的json字段的数据**导出到文件时**会出现乱码，无法正常显示中文，本仓库对`pt-archiver`脚本做了简单处理。

This is a quick fix for: https://forums.percona.com/t/when-pt-archiver-archives-mysql-json-fields-garbled-characters-appear/39307

The Chinese character strings in the json type fields in Mysql cannot be saved correctly to the file, and garbled characters will appear.

### Related Issues

- https://github.com/perl5-dbi/DBD-mysql/issues/309
- https://github.com/jhthorsen/mojo-mysql/issues/57

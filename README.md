# pt-archiver-fix

官方的`pt-archiver`脚本中，将Mysql数据表里含有中文内容的json字段的数据**导出到文件时**会出现乱码，无法正常显示中文，本仓库对`pt-archiver`脚本做了简单处理。

This is a quick fix for: https://forums.percona.com/t/when-pt-archiver-archives-mysql-json-fields-garbled-characters-appear/39307

The Chinese character strings in the json type fields in Mysql cannot be saved correctly to the file, and garbled characters will appear.

### Related Issues

- https://github.com/perl5-dbi/DBD-mysql/issues/309
- https://github.com/jhthorsen/mojo-mysql/issues/57


### Usage

You can download the fixed `pt-archiver` script from this repository and use it in your own environment.

```bash
curl -o /usr/bin/pt-archiver "https://raw.githubusercontent.com/Veitor/pt-archiver-fix/refs/heads/main/pt-archiver.fix" \
    && chmod +x /usr/bin/pt-archiver
```

or use the Docker image:

```bash
git clone https://github.com/Veitor/pt-archiver-fix.git
cd pt-archiver-fix
docker build -t pt-archiver-fix .
docker run -it --rm pt-archiver-fix [OPTIONS] --source <DSN> --where <WHERE>
```
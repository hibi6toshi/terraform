docker build ./ -t tf-study
docker run -it tf-study --help  


```
ENTRYPOINT [""]
CMD ["/bin/sh"]
```
上記を指定すると、コンテナ内で /bin/shを実行できる。
https://blog.naoty.dev/352/

```
docker build ./ -t tf-study
docker run -it tf-study /bin/sh  
```

コンテナ内での動作確認
```
terraform -v
terraform -h
```
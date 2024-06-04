# terraformイメージの指定
FROM hashicorp/terraform:1.8

# ワークディレクトリの指定
WORKDIR /workspace

# ローカルのterraformファイルをコンテナにコピー
COPY ./terraform /workspace

# エントリーポイントの指定
# ENTRYPOINT ["terraform"]
# この行は、コンテナが起動するときに実行されるコマンドを指定しています。ここではterraformコマンドが指定されています。

# 最後に、この行はCMD命令を使用してデフォルトの引数を指定しています。これはENTRYPOINTで指定したコマンドに追加されます。
# ここでは--helpが指定されているため、コンテナが起動するとterraform --helpが実行されます。これはTerraformのヘルプメニューを表示します。ただし、コンテナを起動する際に別の引数を指定すると、その引数がCMDで指定した引数を上書きします。
# デフォルトのコマンドを指定
# CMD ["--help"]

ENTRYPOINT [""]
CMD ["/bin/sh"]

# terraform

## terraform プロバイダーとは
terraform プロバイダーとは特定のクラウドサービスのHTTP APIを呼び出すコンポーネント

`.tf`, `.tf.json` で終わるどのファイルにも定義できるが、ベストプラクティスは`providers.tf`, `require_providers.tf`という名前のファイルに定義する。
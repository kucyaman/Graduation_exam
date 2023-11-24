
## Graduation_exam  
**■ サービス概要**  
大切な思い出の写真を物語に変換します。  
思い出の写真をアップロードして絵本を作成します。AIが写真を判断し物語を生成します。  
出来上がった物語は絵本として公開することができます。  
  
**■ このサービスへの思い・作りたい理由**  
子供との写真を家族で共有するのに『みてね』というアルバムアプリを使っています。  
アップロード画像を選定していると、子供が動きすぎてブレていたり、変な顔をしていたり、  
結構ボツになるものも多いですが、よく見ると動きがあったり個性があったり面白いなと感じました。  
そんなボツ写真たちも、もっといろんな方法で思い出にできたら面白いと思い、今回のアプリを思いつきました。  
  
**■ ユーザー層について**  
最初ユーザー層はファミリーを想定していましたが、写真をまめに撮る人はユーザー層になると考えています。  
今回は特に写真を取る機会も多いファミリー層にしぼりたいと考えています。  
普段写真を取る際に、普通のアルバムだとポーズがマンネリしがちです。  
このアプリを使い物語を生成する際いろんなシュチュエーションをと考えることで、アルバムのバリエーションも広げられると思います。  
  
- ファミリー
- 普段写真を撮る人
  
**■ サービスの利用イメージ**  
写真を取るとき、意外とポーズやアングルはマンネリしがちだと思います。  
絵本を作る感覚で写真を撮ると、いつもとは違ったポーズやアングルを思いつくかもしれません。  
写真を撮る瞬間が少し新鮮なものになってくれたらうれしいです。  
また、見返した際に思い出とともに物語のワンシーンを楽しんでいただけるようなアプリにしたいです。  
  
**■ ユーザーの獲得について**  
RUNTEQ生もかなり子育て層が多いと感じています。子育て層はそれ以外の層にはなかなか共感できない悩みや葛藤が多く、  
自分以外の育児層を発見すると強い共感を感じます。  
https://prtimes.jp/main/html/rd/p/000000026.000029931.html  
https://demand-services.microad.jp/blog/104-housewives-ads  
  
**■ サービスの差別化ポイント・推しポイント**  
【類似アプリ】  
[KidsGallery](https://play.google.com/store/apps/details?id=sato.tokyo.kids_gallery&hl=jp)  
子供の書いた絵をアップするとAIが絵画のような解説を付けてくれる  
  
[みてね](https://mitene.us/) 
写真を家族で共有できる  

１つ目のサービスは、子供の作品をAIで彩るものです。  
本アプリでは作品に限らずすべての思い出を使い絵本風の作品を作成します。撮ったものを思い出として残すプラス、撮影段階から楽しめるようなアプリを目指します。  
  
２つ目のサービスは、アルバムに特化しています。家族間での共有や、アルバムから１０秒動画を生成してくれます。  
本アプリでは絵本という形で独自の思い出を生成します。見せ方やUIを参考にしたいと考えています。  
  
**■ 機能候補 MVPリリース**  
- Google,Xログイン  
  - アルバム機能  
  - 写真アップロード  
  - タグ付け  
  - 説明入力  
  - 画像のAPIを使用し分類 (タグと説明の内容をAIに読ませて物語生成の材料にします)  
- 絵本生成  
  - 写真選択 (あまり情報が多くなるとトークンがすごそうなので起承転結の４枚、もしくは３枚程度を考えています。他にも制限をかけるかも)
  - 表紙イメージの選択 （イメージは３パターンくらい作成しようと考えています。りーどみーが可愛かったので入力の感じとかを参考にしたいです。素材はフリー素材を使って自作する予定です。）
  
**■ 本リリース**  
- フレンド機能  
  -フレンドにだけ公開できるようにするため
-Like
-コメント
-その他外部ログイン　 X
-家族へのシェア（みてねの機能参考）
  -家族の招待機能
-不適切な画像のバリデーション[Google Cloud Vision API](https://qiita.com/kumaryoya/items/7d2ee56a10172b7f0b29)
  
**■ 機能の実装方針予定**  
- Cloudinary (写真をメインで扱うアプリなので、画像APIはなるべくグレードの高いものを使いたいです。キャッチアップ途中)  
- AWS S3  
- renderでのデプロイ  
- ログイン機能（Google,X,Instagram）  
- 写真を解析してくれるAI（先輩のPFで画像から人を解析して除外したりできるAPIがある話を伺ったので調査中）  
- レスポンシブデザイン （写真を取るのはスマホなのでレスポンシブは必須だと考えています）  
- Dockerによる環境構築 （【余裕があれば】Reactを勉強中なので、MVP後にフロントをReactに変えたいです。その際Dockerで両方立ち上げるのが楽と聞いたのでDockerを取り入れたいです）  


お疲れ様です！ アプリのタイトルがまだ未定です。 技術選定の細かい部分がまだキャッチアップしきれていない部分もありますが、調べたものに関しては追記していきます。
ご確認お願い致します。

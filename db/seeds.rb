User.create!(name: "管理者ユーザー",
             email: "admin@example.com",
             password:              "password",
             password_confirmation: "password",
             admin:true)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# category
Category.create!(id: 1,
                 name: "レース",
                 image: File.open(Rails.root.join("public/images/category/Q4.jpg")))

Category.create!(id: 2,
                name: "ハイグリップ",
                image: File.open(Rails.root.join("public/images/category/SupercorsaSC.jpg")))

Category.create!(id: 3,
                name: "スポーツ",
                image: File.open(Rails.root.join("public/images/category/power5.jpg")))

Category.create!(id: 4,
                name: "ツーリング",
                image: File.open(Rails.root.join("public/images/category/RX-02_01.jpg")))

# item
Item.create!(name: "スーパーコルサ SC V3",
             image: File.open(Rails.root.join("public/images/item/SupercorsaSC.jpg")),
             content: "ピレリが誇る新世代の公道走行可能な溝付き最強レースタイヤ",
             category_ids: 1)

Item.create!(name: "レーステックRR",
            image: File.open(Rails.root.join("public/images/item/racetecRR.jpg")),
            content: "公道レースで勝つために生まれたRACETEC™RRが最高のパフォーマンスをお届けします",
            category_ids: 1)

Item.create!(name: "パワーカップ 2",
            image: File.open(Rails.root.join("public/images/item/powercup.jpg")),
            content: "レースからサーキット走行までよりアグレッシブなライディングを楽しむために、新しいトレッドパターンを採用した公道走行可能なサーキット用タイヤ",
            category_ids: 1)

Item.create!(name: "スポーツマックス Q4",
            image: File.open(Rails.root.join("public/images/item/Q4.jpg")),
            content: "USダンロップがスリックタイヤ・テクノロジーを駆使して開発。",
            category_ids: 1)

Item.create!(name: "バトラックスレーシング R11",
            image: File.open(Rails.root.join("public/images/item/r11.jpg")),
            content: "コンマ１秒へのこだわり。深化したコーナリングスピードを体感せよ。",
            category_ids: 1)

Item.create!(name: "ロッソコルサ 2",
            image: File.open(Rails.root.join("public/images/item/rossocorsa2.jpg")),
            content: "ピレリ初のマルチコンパウンド採用。サーキットでのパフォーマンスをストリートでも",
            category_ids: 2)

Item.create!(name: "スポルテック M9RR",
            image: File.open(Rails.root.join("public/images/item/m9_rr.jpg")),
            content: "路面または天候の変化に関わらず、想定外の心配が無くライディングの楽しみを向上する「日常を楽しむ」スーパースポーツタイヤ。",
            category_ids: 2)

Item.create!(name: "パワーGP",
            image: File.open(Rails.root.join("public/images/item/power-gp.jpg")),
            content: "サーキットとストリートで優れたパフォーマンスを両立するために定評のあるMICHELIN POWER RSのトレッドパターンをダイレクトに採用",
            category_ids: 2)

Item.create!(name: "スポーツマックス α14",
            image: File.open(Rails.root.join("public/images/item/α14.jpg")),
            content: "アグレッシブな走りを楽しむためのレースレプリカ・ラジアル。",
            category_ids: 2)

Item.create!(name: "バトラックスレーシング RS11",
            image: File.open(Rails.root.join("public/images/item/rs11.jpg")),
            content: "ストリート用ハイグリップタイヤの頂点がここに！",
            category_ids: 2)

Item.create!(name: "バトラックスハイパースポーツ S22",
            image: File.open(Rails.root.join("public/images/item/S22.jpg")),
            content: "走った後の、急な雨。そんなシーンでも安心感をもって帰れるこのタイヤは、心強い相棒だ。",
            category_ids: 3)

Item.create!(name: "スポーツマックス ロードスポーツ 2",
            image: File.open(Rails.root.join("public/images/item/roadsports2.jpg")),
            content: "速さよりも巧さを求めるライダーのためのプレミアム・スポーツラジアル。",
            category_ids: 3)

Item.create!(name: "パワー 5",
            image: File.open(Rails.root.join("public/images/item/power5.jpg")),
            content: "ストリートでの優れたパフォーマンスを発揮し、更にシリカコンパウンドと新設計のトレッドパターンの採用により、ウェット路面でも高いウェットグリップを発揮",
            category_ids: 3)

Item.create!(name: "スポルテック M7RR",
            image: File.open(Rails.root.join("public/images/item/m7_rr.jpg")),
            content: "SPORTEC™M7 RRは、ロードレースの経験を基に開発、天候や気温などのあらゆる条件においてスポーツライダーが実力を発揮できるように設計されています。",
            category_ids: 3)

Item.create!(name: "ロッソ 3",
            image: File.open(Rails.root.join("public/images/item/RossoIII.jpg")),
            content: "新世代の走りへの準備はできていますか？よりソフトなトレッドを持つショルダー部を広くとるバイ・コンパウンド製法は、スタートから中間程度までのリーン・アングルで最高のグリップ力を発揮",
            category_ids: 3)

Item.create!(name: "RX-02",
            image: File.open(Rails.root.join("public/images/item/RX-02_01.jpg")),
            content: "クォータークラスに最適な現代のオンロードバイアス",
            category_ids: 4)

  Item.create!(name: "TT900GP",
              image: File.open(Rails.root.join("public/images/item/tt900gp.jpg")),
              content: "ダンロップの最高峰スポーツバイアス。サーキットでも高いポテンシャルを発揮するハイグリップタイヤ。",
              category_ids: 4)

Item.create!(name: "BT-39",
            image: File.open(Rails.root.join("public/images/item/bt39.jpg")),
            content: "スポーツとコンフォートの両面を併せ持つスポーツバイアスのスタンダード",
            category_ids: 4)

Item.create!(name: "パイロットロード 2",
            image: File.open(Rails.root.join("public/images/item/pilotroad.jpg")),
            content: "ツーリングでの走る楽しさの追求と、それを支える安全性の向上にフォーカス",
            category_ids: 4)

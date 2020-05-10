class Brand < ActiveHash::Base
  self.data = [
      {id: 0, name: '指定なし'},
      {id: 1, name: 'ルイ・ヴィトン'}, {id: 2, name: 'エルメス'}, {id: 3, name: 'バーバリー'},
      {id: 4, name: 'グッチ'}, {id: 5, name: 'プラダ'}, {id: 6, name: 'クリスチャン・ディオール'},
      {id: 7, name: 'シャネル'}, {id: 8, name: 'ブルガリ'}, {id: 9, name: 'ティファニー'},
      {id: 10, name: 'カルティエ'}, {id: 11, name: 'ドルチェ＆ガッバーナ'}, {id: 12, name: 'フェラガモ'}
  ]
end
class Shipping < ActiveHash::Base
  self.data = [
      {id: 1, name: '未定'}, {id: 2, name: 'ゆうメール'}, {id: 3, name: 'ゆうパック'},
      {id: 4, name: 'ゆうパケット'}, {id: 5, name: 'クロネコヤマト'}, {id: 6, name: 'レターパック'},
      {id: 7, name: 'クリックポスト'}, {id: 8, name: '普通郵便(定形、定形外)'}
  ]
end
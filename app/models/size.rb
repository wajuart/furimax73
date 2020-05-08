class Size < ActiveHash::Base
  self.data = [
      {id: 1, name: 'XXS以下'}, {id: 2, name: 'XS(SS)'}, {id: 3, name: 'S'},
      {id: 4, name: 'M'}, {id: 5, name: 'L'}, {id: 6, name: 'XL(LL)'},
      {id: 7, name: '2XL(3L)'}, {id: 8, name: '3XL(4L)以上'}, {id: 9, name: '4XL(5L)以上'},
      {id: 10, name: '23.5cm以下'}, {id: 11, name: '24cm'}, {id: 12, name: '24.5cm'},
      {id: 13, name: '25cm'}, {id: 14, name: '25.5cm'}, {id: 15, name: '26cm以上'},
      {id: 16, name: '60cm'}, {id: 17, name: '70cm'}, {id: 18, name: '80cm'},
      {id: 19, name: '90cm'}, {id: 20, name: '100cm'}, {id: 21, name: '110cm'},
      {id: 22, name: '120cm'}, {id: 23, name: '130cm'}, {id: 24, name: '140cm'},
      {id: 25, name: '150cm'}, {id: 26, name: '160cm'}, {id: 27, name: 'FREE SIZE'}
  ]
end
class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '展示会・見本市など' },
    { id: 3, name: '即売会・フリーマーケットなど' },
    { id: 4, name: '体験・ワークショップなど' },
    { id: 5, name: 'スポーツ・レクリエーション' },
    { id: 6, name: '楽器の演奏・コンサートなど'},
    { id: 7, name: '学習・セミナー・講義など' },
    { id: 8, name: '会議・面接など' },
    { id: 9, name: 'オフ会' },
    { id: 10, name: 'パーティー' },
    { id: 11, name: 'その他' }
  ]
 end
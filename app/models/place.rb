class Place < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '美術室' },
    { id: 3, name: '展示室' },
    { id: 4, name: '料理室' },
    { id: 5, name: 'ワークショップ室' },
    { id: 6, name: '体育館' },
    { id: 7, name: '多目的ホール' },
    { id: 8, name: 'コンサートホール' },
    { id: 9, name: '会議室' },
    { id: 10, name: '集会室' },
    { id: 11, name: '和室' },
  ]

  include ActiveHash::Associations
  has_many :events
 end
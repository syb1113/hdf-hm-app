export  interface  goodCategory{
  createdAt: number,
  updatedAt: number,
  id: number,
  name: string,
  coverImage: string,
  desc: string,
  parent: number
}

export interface  GoodListData{
  createdAt?: number,
  updatedAt?: number,
  id?: number,
  name: string,
  coverImage: string,
  desc: string,
  amount: number,
  price: number,
  views?: number,
  onSale?: number,
  category?:goodCategory
}

export  interface  AddCardData{
  product:number,
  amount:number,
  price:number
}

export  interface  CartData {
  createdAt: number,
  updatedAt: number,
  id: number,
  amount: number,
  price: number,
  user:number,
  product:GoodListData
}
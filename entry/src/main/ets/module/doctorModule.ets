export  interface  doctorModule{
  createdAt: number,
  updatedAt: number,
  id: string,
  name: string,
  avatar: string,
  desc: string,
  tags: number,
  hospitalInfo:HospitalInfo
}

export  interface  HospitalInfo{
  name:string,
  desc:string,
  phone:string,
  address:string
}
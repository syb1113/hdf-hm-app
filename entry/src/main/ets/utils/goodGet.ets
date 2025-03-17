import { rcp } from '@kit.RemoteCommunicationKit'

class MyInterceptor implements rcp.Interceptor {
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    context.request.headers!.Token = AppStorage.get<string>('token') // 此处这段代码的意思就是设置token
    return next.handle(context)
  }
}

export class HttpClient {
  private static _session: rcp.Session // 静态变量，初始化的时候就会创建

  static getInstance() {
    if (HttpClient._session) {
      return HttpClient._session
    }
    HttpClient._session = rcp.createSession({
      interceptors: [new MyInterceptor()], // 拦截器
    })
    return HttpClient._session
  }
}

export const SERVER_URL = "http://192.168.15.109:3006/"

export function dalImg(str: string) {
  if (str) {
    if (str.startsWith("http")) {
      return str
    }
    return SERVER_URL + str
  }
  return "https://img1.baidu.com/it/u=2841183583,1501907163&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500"
}
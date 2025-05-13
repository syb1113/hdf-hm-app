import rcp from '@hms.collaboration.rcp';

class MyInterceptor implements rcp.Interceptor {
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    context.request.headers!.Token = AppStorage.get<string>('token'); // 此处这段代码的意思就是设置token
    return next.handle(context)
  }
}

class HttpClient {
  private static session: rcp.Session

  static getSession() {
    if (HttpClient.session) {
      return HttpClient.session
    }
    HttpClient.session = rcp.createSession({
      interceptors: [new MyInterceptor()], // 拦截器
    })
    return HttpClient.session
  }
}
export const baseUrl: string = "http://192.168.187.182:3006"

export function rcpGET(url: string) {
  url = baseUrl + url
  return HttpClient.getSession().get(url)
}
export function rcpPost(url: string, data?: object) {
  url = baseUrl + url
  return HttpClient.getSession().post(url, data)
}

export function rcpDel(url: string, data?: object) {
  url = baseUrl + url
  return HttpClient.getSession().delete(url)
}

export function rcpPut(url: string, data?: object) {
  url = baseUrl + url
  return HttpClient.getSession().put(url,data)
}

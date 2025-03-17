import rcp from '@hms.collaboration.rcp';

class MyInterceptor implements rcp.Interceptor {
  intercept(context: rcp.RequestContext, next: rcp.RequestHandler): Promise<rcp.Response> {
    context.request.headers!.Token = AppStorage.get<string>('token')?.toString(); // 此处这段代码的意思就是设置token
    context.request.headers!['Content-Type'] = 'application/form-data';
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
// corporation
export const baseUrl: string = "http://192.168.1.27:3006"

// local
// export const baseUrl: string = "http://192.168.1.27:3006"

export function rcpGET(url: string, query?: string, value?: string) {
  url = baseUrl + url
  return HttpClient.getSession().get(url)
}

export function rcpPost(url: string, data: object) {
  url = baseUrl + url
  return HttpClient.getSession().post(url, data)
}

export function rcpPut(url: string, data: object) {
  url = baseUrl + url
  return HttpClient.getSession().put(url, data)
}

export function rcpDel(url: string, data?: object) {
  url = baseUrl + url
  return HttpClient.getSession().delete(url)
}
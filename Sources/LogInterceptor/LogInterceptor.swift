import NetworkClient
import Foundation

public class LogInterceptor: Interceptor {
    public init(){
    }

    public func intercept(request: Request, chain: Chain) async throws -> (Data, URLResponse) {
        #if DEBUG
        debugPrint(request)
        do {
            let response = try await chain.proceed(request: request)
            debugPrint(response)
            return response
        } catch {
            debugPrint(error)
            throw error
        }
        #else
        return try await chain.proceed(request: request)
        #endif
    }
}

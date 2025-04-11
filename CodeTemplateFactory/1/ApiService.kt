package 1

import retrofit2.http.GET
import javax.inject.Inject
import javax.inject.Singleton

interface ApiService {
    @GET("data")
    suspend fun getData(): List<Any>
}

@Singleton
class ApiServiceImpl @Inject constructor(
    private val retrofit: Retrofit
) : ApiService {
    private val service: ApiService by lazy {
        retrofit.create(ApiService::class.java)
    }

    override suspend fun getData(): List<Any> = service.getData()
} 
package 1

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MainRepository @Inject constructor(
    private val apiService: ApiService,
    private val localDataSource: LocalDataSource
) {
    suspend fun getData(): List<Any> = withContext(Dispatchers.IO) {
        try {
            // API ?몄텧 ?쒕룄
            apiService.getData()
        } catch (e: Exception) {
            // API ?ㅽ뙣 ??濡쒖뺄 ?곗씠??諛섑솚
            localDataSource.getData()
        }
    }
} 

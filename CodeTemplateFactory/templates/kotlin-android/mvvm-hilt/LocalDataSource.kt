package 1

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Dao
interface DataDao {
    @Query("SELECT * FROM data")
    fun getAll(): Flow<List<DataEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAll(data: List<DataEntity>)
}

@Singleton
class LocalDataSource @Inject constructor(
    private val dataDao: DataDao
) {
    fun getData(): Flow<List<DataEntity>> = dataDao.getAll()

    suspend fun saveData(data: List<DataEntity>) {
        dataDao.insertAll(data)
    }
} 

package 1

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

data class MainUiState(
    val isLoading: Boolean = false,
    val error: String? = null,
    val data: List<Any> = emptyList()
)

@HiltViewModel
class MainViewModel @Inject constructor(
    private val repository: MainRepository
) : ViewModel() {

    private val _uiState = MutableLiveData(MainUiState())
    val uiState: LiveData<MainUiState> = _uiState

    fun loadData() {
        viewModelScope.launch {
            try {
                _uiState.value = _uiState.value?.copy(isLoading = true)
                val data = repository.getData()
                _uiState.value = _uiState.value?.copy(
                    isLoading = false,
                    data = data
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value?.copy(
                    isLoading = false,
                    error = e.message
                )
            }
        }
    }
} 

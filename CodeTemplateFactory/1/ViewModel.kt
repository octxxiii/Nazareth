package 1

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class {{ screen_name }}ViewModel @Inject constructor(
    private val repository: {{ screen_name }}Repository
) : ViewModel() {

    private val _uiState = MutableLiveData<{{ screen_name }}UiState>()
    val uiState: LiveData<{{ screen_name }}UiState> = _uiState

    init {
        loadData()
    }

    private fun loadData() {
        viewModelScope.launch {
            try {
                // TODO: Load data from repository
                _uiState.value = {{ screen_name }}UiState.Success
            } catch (e: Exception) {
                _uiState.value = {{ screen_name }}UiState.Error(e.message ?: "Unknown error")
            }
        }
    }
}

sealed class {{ screen_name }}UiState {
    object Loading : {{ screen_name }}UiState()
    object Success : {{ screen_name }}UiState()
    data class Error(val message: String) : {{ screen_name }}UiState()
} 
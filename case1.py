import numpy as np

def sum_negative_between_min_max(arr):
    # Находим где стоят самый маленький и самый большой элементы
    min_index = np.argmin(arr)  # позиция минимального элемента
    max_index = np.argmax(arr)  # позиция максимального элемента
    
    # Определяем левую и правую границы между ними
    left = min(min_index, max_index)   # начало промежутка
    right = max(min_index, max_index)  # конец промежутка
    
    # Берём элементы между границами (не включая их самих)
    between_elements = arr[left + 1 : right]
    
    # Считаем сумму отрицательных чисел в этом промежутке
    total = 0
    for num in between_elements:
        if num < 0:  # если число отрицательное
            total += num  # добавляем к сумме
            
    return total

# Основная часть программы
if __name__ == "__main__":
    print("=" * 50)
    print("Решение задачи по сумме отрицательных элементов")
    print("=" * 50)
    
    # Первый тестовый массив (из условия)
    A = np.array([3, -2, 8, -5, 1, -9, 4])
    result_A = sum_negative_between_min_max(A)
    print("\nТест 1 (основной пример):")
    print(f"Массив: {A}")
    print(f"Минимальный элемент: {A.min()} на позиции {np.argmin(A)}")
    print(f"Максимальный элемент: {A.max()} на позиции {np.argmax(A)}")
    print(f"Сумма отрицательных между ними: {result_A}")
    
    # Второй тестовый массив (все положительные)
    B = np.array([5, 10, 15, 20])
    result_B = sum_negative_between_min_max(B)
    print("\nТест 2 (все положительные):")
    print(f"Массив: {B}")
    print(f"Минимальный элемент: {B.min()} на позиции {np.argmin(B)}")
    print(f"Максимальный элемент: {B.max()} на позиции {np.argmax(B)}")
    print(f"Сумма отрицательных между ними: {result_B}")
    
    # Третий тестовый массив (min и max рядом)
    C = np.array([10, 20, 5, 30, 15])
    result_C = sum_negative_between_min_max(C)
    print("\nТест 3 (min и max рядом):")
    print(f"Массив: {C}")
    print(f"Минимальный элемент: {C.min()} на позиции {np.argmin(C)}")
    print(f"Максимальный элемент: {C.max()} на позиции {np.argmax(C)}")
    print(f"Сумма отрицательных между ними: {result_C}")
    
    # Четвертый тестовый массив (все отрицательные)
    D = np.array([-1, -2, -3, -4])
    result_D = sum_negative_between_min_max(D)
    print("\nТест 4 (все отрицательные):")
    print(f"Массив: {D}")
    print(f"Минимальный элемент: {D.min()} на позиции {np.argmin(D)}")
    print(f"Максимальный элемент: {D.max()} на позиции {np.argmax(D)}")
    print(f"Сумма отрицательных между ними: {result_D}")
    
    print("\n" + "=" * 50)
    print("Программа завершена!")
    print("=" * 50)
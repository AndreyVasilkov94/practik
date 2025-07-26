# Базовый класс: Транспортное средство
class Vehicle:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model
    
    def display_info(self):
        print(f"Транспорт: {self.brand} {self.model}")
    
    def start_engine(self):
        print("Двигатель запущен!")

# Производный класс 1: Автомобиль
class Car(Vehicle):
    def __init__(self, brand, model, num_doors):
        super().__init__(brand, model)
        self.num_doors = num_doors
    
    def display_info(self):  # Переопределение метода
        print(f"Автомобиль: {self.brand} {self.model}, Дверей: {self.num_doors}")
    
    def honk(self):  # Уникальный метод
        print("Би-бип!")

# Производный класс 2: Мотоцикл
class Motorcycle(Vehicle):
    def __init__(self, brand, model, has_sidecar):
        super().__init__(brand, model)
        self.has_sidecar = has_sidecar
    
    def display_info(self):  # Переопределение метода
        sidecar_info = "с коляской" if self.has_sidecar else "без коляски"
        print(f"Мотоцикл: {self.brand} {self.model}, {sidecar_info}")
    
    def wheelie(self):  # Уникальный метод
        print("Поднимаем переднее колесо!")

# Основная программа
if __name__ == "__main__":
    print("="*50)
    print("Демонстрация работы классов")
    print("="*50)
    
    # Создаем объекты
    generic_vehicle = Vehicle("Generic", "T1000")
    my_car = Car("Toyota", "Camry", 4)
    my_bike = Motorcycle("Harley-Davidson", "Sportster", False)
    sidecar_bike = Motorcycle("Ural", "Tourist", True)
    
    # Демонстрация работы методов
    print("\n1. Базовый класс:")
    generic_vehicle.display_info()
    generic_vehicle.start_engine()
    
    print("\n2. Производный класс - Автомобиль:")
    my_car.display_info()
    my_car.start_engine()  # Унаследованный метод
    my_car.honk()          # Уникальный метод
    
    print("\n3. Производный класс - Мотоцикл:")
    my_bike.display_info()
    my_bike.start_engine()  # Унаследованный метод
    my_bike.wheelie()       # Уникальный метод
    
    print("\n4. Еще один мотоцикл:")
    sidecar_bike.display_info()
    sidecar_bike.start_engine()
    
    print("\n" + "="*50)
    print("Демонстрация завершена!")
    print("="*50)
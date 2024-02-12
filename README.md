

## Вычисление площади круга по радиусу и треугольника по трем сторонам

#### Ссылка на текст тестового задания [в google docs](https://docs.google.com/document/d/1rPHrw8JMLefuI3Ps-tpwFvfCPfq3xOekPQraOH6nAMg/edit?usp=sharing)

---

### Для удобства ниже приведены ключевые сущности из проекта

> ❗️ Основная реализация лежит в файле [Contents](AreaCalculator.playground/Contents.swift)

#### Протокол для работы с фигурами
```swift
// MARK: - Figure Protocol
// Протокол для фигуры, чтобы работать не с конкретным типом фигуры, а с абстракцией
protocol Figure {
    var name: String { get }
    func calculateArea() -> Float
}
```

#### Структура для треугольника
```swift
struct Triangle: Figure {
    let name = "Треугольник"
    
    var sideA: Float
    var sideB: Float
    var sideC: Float
    
    init?(sideA: Float, sideB: Float, sideC: Float) {
        guard sideA > 0 && sideB > 0 && sideC > 0 else { print("Для фигуры \"\(name)\" ведите значения выше 0"); return nil }
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
    }
    
    func calculateArea() -> Float {
        let p = (sideA + sideB + sideC) / 2
        let s = sqrt(p * (p - sideA) * (p - sideB) * (p - sideC))
        return s
    }
    
    // Проверка на то, является ли треугольник прямоугольным
    var isRectangularTriangle: Bool {
        return pow(sideA, 2) + pow(sideB, 2) == pow(sideC, 2) ||
        pow(sideA, 2) + pow(sideC, 2) == pow(sideB, 2) ||
        pow(sideB, 2) + pow(sideC, 2) == pow(sideA, 2)
    }
}
```

#### Метод для вычисления площади фигуры
```swift
// MARK: - Calculating Area
// Вычисление площади фигуры без знания типа фигуры
func calculateArea(for figure: Figure) -> Float {
    return figure.calculateArea()
}
```

#### Код клиента
```swift
if let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5) {
    print("Площадь фигуры \(triangle.name) = \(calculateArea(for: triangle))")
    print(triangle.isRectangularTriangle)
}
```
#### Результат выполнения
```
Площадь фигуры Треугольник = 6.0
true
```

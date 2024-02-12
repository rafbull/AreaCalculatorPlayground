import Foundation

// MARK: - AreaCalculator

// MARK: - Figure Protocol
// Протокол для фигуры, чтобы работать не с конкретным типом фигуры, а с абстракцией
protocol Figure {
    var name: String { get }
    func calculateArea() -> Float
}


// MARK: - Concrete Figure
// Каждая фигура будет подписываться под протокол `Figure` и реализовывать метод `calculateArea() -> Float`
struct Circle: Figure {
    let name = "Круг"
    
    var radius: Float
    
    // Используется `failable init` для проверки введенных значений фигуры.
    // Если введенные значения `< 0`, то веренется nil.
    init?(radius: Float) {
        guard radius > 0 else { print("Для фигуры \"\(name)\" ведите значения выше 0"); return nil }
        self.radius = radius
    }
    
    func calculateArea() -> Float {
        let area = .pi * pow(radius, 2)
        return area
    }
}

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

// MARK: - Calculating Area
// Вычисление площади фигуры без знания типа фигуры
func calculateArea(for figure: Figure) -> Float {
    return figure.calculateArea()
}


// MARK: - Client Code

if let circle = Circle(radius: 10) {
    print("Площадь фигуры \(circle.name) = \(calculateArea(for: circle))")
}

if let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5) {
    print("Площадь фигуры \(triangle.name) = \(calculateArea(for: triangle))")
    print(triangle.isRectangularTriangle)
}

if let wrongCircle = Circle(radius: -13) {
    print("Площадь фигуры \(wrongCircle.name) = \(calculateArea(for: wrongCircle))")
}

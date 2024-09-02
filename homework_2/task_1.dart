import 'dart:math';

class ComplexNumber {
  final double real;
  final double imaginary;
  
  const ComplexNumber(this.real, this.imaginary);
  
  double get abs => sqrt(real * real + imaginary * imaginary);
  
  ComplexNumber operator+(ComplexNumber b) {
    return ComplexNumber(real + b.real, imaginary + b.imaginary);
  }
  
  ComplexNumber operator-(ComplexNumber b) {
    return ComplexNumber(real - b.real, imaginary - b.imaginary);
  }
  
  ComplexNumber operator*(ComplexNumber b) {
    return ComplexNumber(
      real * b.real - imaginary * b.imaginary, 
      real * b.imaginary + imaginary * b.real
    );
  }
  
  bool operator>(ComplexNumber b) {
    return abs > b.abs;
  }
}


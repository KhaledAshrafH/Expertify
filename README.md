# Expert Systems Using CLIPS and JAVA

This repository contains the implementation of several expert systems using the CLIPS (C Language Integrated Production System) programming language. Each problem is implemented as a separate module within the repository. The expert systems cover a range of domains including family relationships, flag colors, GPA calculation, shape manipulation, and person information.

## Problem Descriptions

### 1. Family Knowledge Base

The Family Knowledge Base module focuses on representing and inferring family relationships. It includes facts and rules for representing parents, grandparents, and other related information within a family. The implemented rules infer and add facts about parents, grandfathers, and grandmothers based on the given facts. The module utilizes CLIPS working memory to store and manipulate the family information.

### 2. Flag Colors

The Flag Colors module allows users to input a color and retrieves a list of countries whose flags contain the specified color. The module is implemented as a program that prompts the user for a color value and then searches a predefined table of country flags and their associated colors. The module returns a list of countries matching the specified color.

### 3. GPA Calculation

The GPA Calculation module reads a data file containing a list of people's names and their grades in four courses. It calculates the GPA (Grade Point Average) for each person and writes the new list, including the calculated GPAs, to an output file. The module performs the necessary calculations based on the input file's data and utilizes file I/O operations to read and write the required information.

### 4. Shape Manipulation

The Shape Manipulation module deals with shapes and their properties. It defines a superclass called "Shape" with common attributes such as ID and color. The module also defines two subclasses: "Square" and "Rectangle." Each subclass adds specific attributes related to its shape (e.g., length, width). The module includes message handlers to calculate the area and perimeter of shapes. The implemented rules use instances of the defined classes to test the output of the message handlers.

### 5. Shape Computations

The Shape Computations module focuses on computing the sum of areas and perimeters for a series of shapes. It utilizes predefined deftemplates for different shapes, including square, rectangle, and circle. The module implements rules that calculate the sum of areas and perimeters based on the given facts about the shapes. The module includes a set of predefined facts to test the output of the implemented rules.

### 6. Person Template

The Person Template module defines a template for representing a person, including their full name and children's names. The module includes rules that print the parents who have more than three children and the parent of a specified child. The module utilizes the specified child's name asserted as a fact to determine and print the corresponding parent's name.

## Usage

Each module within the repository can be executed independently. They can be integrated into a larger system or used as standalone expert systems. The implementation utilizes the CLIPS programming language and framework, which should be installed in the execution environment to run the modules successfully.

## Additional Notes



## Contributing

The expert systems implemented in this repository are designed to demonstrate the capabilities of CLIPS and showcase various problem-solving techniques. They may not cover all possible scenarios or edge cases. Feel free to enhance and extend the modules as per your specific requirements.

If you encounter any issues or have suggestions for improvements, please submit an issue or pull request in the repository.

## Team

- [Khaled Ashraf Hanafy Mahmoud - 20190186](https://github.com/KhaledAshrafH).
- [Samah Moustafa Hussien Mahmoud - 20190248](https://github.com/Samah-20190248).

## Acknowledgments

This project is based on Semantic Web course at Faculty of Computers and Artificial Intelligence Cairo University. We would like to thank Prof. Abeer Elkorany for his guidance and support throughout this course.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

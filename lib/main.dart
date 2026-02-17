import 'package:flutter/material.dart';

void main(){
    runApp(const Planejamento());

}
class Planejamento extends StatelessWidget{
    const Planejamento({super.key});

    @Override
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tentativa',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
        );

    }
}

class Entrada extends StatelessWidget{
    const Entrada({Super.key});

    @Override
    Widget build(BuildContext context){
        return
    }
}
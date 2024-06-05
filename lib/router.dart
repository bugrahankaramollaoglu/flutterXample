/* router olayı şöyle kullanılıyor:

unnamed routers:

  Navigator.push(context,MaterialPageRoute(builder: (context) => OrderPage()),);


named routers:

  return MaterialApp(
    title: 'My Flutter App',
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/second': (context) => SecondPage(),
    },
  );

  Navigator.pushNamed(context, '/second');

  Navigator.popUntil(context, ModalRoute.withName('/'));

Popping the current route off the stack:

  Navigator.pop(context);

Passing data:

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SecondPage(data: 'Hello'),
    ),
  );

Then retrieve it as:

  class SecondPage extends StatelessWidget {
    final String data;
    SecondPage({required this.data});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Text(data),
        ),
      );
    }
  }
 */



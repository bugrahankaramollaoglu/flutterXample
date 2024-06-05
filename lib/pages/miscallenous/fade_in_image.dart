import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/* FadeInImage, bir resim yüklenirken bir yükleme animasyonu gösterir.
FadeInImage.memoryNetwork, bellekteki bir resmi yüklerken bir yükleme animasyonu gösterir.
placeholder: kTransparentImage, bellekteki bir resmi yüklerken bir yükleme animasyonu gösterir.
image: 'https://picsum.photos/250?image=9', yüklenecek resmin url'sidir vs.
you need -> google pub add transparent_image
 */

class FadeinImage extends StatelessWidget {
  const FadeinImage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Fade in images';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Stack(
        children: <Widget>[
          const Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=4',
            ),
          ),
        ],
      ),
    );
  }
}

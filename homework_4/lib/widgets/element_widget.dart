import 'package:flutter/material.dart';

class ElementWidget extends StatelessWidget {
  const ElementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(color: Colors.grey[400]),
      child: Padding(
        padding: const EdgeInsets.all(10), 
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/element_image.jpg', height: 200),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Открытие нового пляжа этим летом',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  const Flexible(
                    child: Text(
                      'Этим летом состоится открытие нового элитного пляжа сто тысяч звезд. Все желающие могут оценить это творение инженерной и водяной мысли. Церемония...',
                      maxLines: 10,
                      style: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {}, 
                      child: Container(
                        decoration: const BoxDecoration(color: Color(0xffbeb29a)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), 
                          child: Text(
                            'ПОДРОБНЕЕ', 
                            style: TextStyle(fontSize: 20, color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

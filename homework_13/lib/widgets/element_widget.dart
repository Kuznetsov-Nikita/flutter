import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  Text(
                    AppLocalizations.of(context)!.newsTitle,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.newsDescription,
                      maxLines: 10,
                      style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {}, 
                      child: Container(
                        decoration: const BoxDecoration(color: Color(0xffbeb29a)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), 
                          child: Text(
                            AppLocalizations.of(context)!.inDetail, 
                            style: const TextStyle(fontSize: 20, color: Colors.black87),
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

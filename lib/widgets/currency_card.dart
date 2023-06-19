import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int offset;

  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted,
      required this.offset,});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: (offset == 0)? const Offset(0, -20) : Offset(0, offset * (-20)),
      child: Container(
        //어떤 위젯이 오퍼플로우 했을 때, 카드와 같은 container로 하여금 어떻게 동작하게끔 할건지 알려주는 장치
        //보통 Clip.none으로 되어있는데, 컨테이너를 넘처흐른다 해도 허용한다는 뜻임.
        //hardEdge는 넘쳐흐르는것들을 cut함
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted? _blackColor : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //아이콘의 크기 변경을 위한 scale
              Transform.scale(
                scale: 2.2,
                //아이콘의 x,y좌표 변경을 위한 translate
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(icon,
                      color: isInverted? _blackColor : Colors.white, size: 88),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

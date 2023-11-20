import 'package:digimon_2324/shinchan_model.dart';
import 'shinchan_detail_page.dart';
import 'package:flutter/material.dart';


class ShinChanCard extends StatefulWidget {
  final ShinChanChar shinChan;

  const ShinChanCard(this.shinChan, {super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _ShinChanCardState createState() => _ShinChanCardState(shinChan);
}

class _ShinChanCardState extends State<ShinChanCard> {
  ShinChanChar shinChan;
  String? renderUrl;

  _ShinChanCardState(this.shinChan);

  @override
  void initState() {
    super.initState();
    renderShinChanPic();
  }

  Widget get shinChanImage {
    var shinChanAvatar = Hero(
      tag: shinChan,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.black54, Colors.black, Color.fromARGB(255, 84, 110, 122)])),
      alignment: Alignment.center,
      child: const Text(
        'SHIN-CHAN',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: shinChanAvatar,
      // ignore: unnecessary_null_comparison
      crossFadeState: renderUrl == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderShinChanPic() async {
    await shinChan.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = shinChan.imageUrl;
      });
    }
  }

  Widget get shinChanCard {
    return Positioned(
      right: 0.0,
      child: SizedBox(
        width: 290,
        height: 115,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: const Color(0xFFF8F8F8),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.shinChan.id,
                  style: const TextStyle(color: Color(0xFF000600), fontSize: 27.0),
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.star, color: Color(0xFF000600)),
                    Text(': ${widget.shinChan.rating}/10', style: const TextStyle(color: Color(0xFF000600), fontSize: 14.0))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showShinChanDetailPage() async {
  var updatedRating = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return ShinChanDetailPage(shinChan);
  }));

  if (updatedRating != null) {
    setState(() {
      widget.shinChan.rating = updatedRating;
    });
  }
}
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showShinChanDetailPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              shinChanCard,
              Positioned(top: 7.5, child: shinChanImage),
            ],
          ),
        ),
      ),
    );
  }
}
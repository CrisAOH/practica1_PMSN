import 'package:flutter/material.dart';
import 'package:practica1/models/protagonists.dart';

final listGame = ['VLN', 'LN', 'LN II', 'LN III'];

final listProtagonist = [
  Protagonist(
    'Very Little Nightmares',
    'The Girl in the Yellow Raincoat',
    'As she wandered, it sometimes seemed to the girl as if there was no one in all that huge rambling house but her own small self. Oh, if only that were true.',
    'The Craftsman, The Butler, The Pretender',
    'Six',
    [
      ImageProtagonist(
        'assets/girlyellowraincoat1.png',
        const Color(0xff9AEFB1),
      ),
      ImageProtagonist(
        'assets/girlyellowraincoat2.webp',
        const Color(0xff7DC18F),
      ),
      ImageProtagonist(
        'assets/girlyellowraincoat3.webp',
        const Color(0xff5E8F6B),
      ),
      ImageProtagonist(
        'assets/girlyellowraincoat4.webp',
        const Color(0xff3C4F41),
      ),
    ],
  ),
  Protagonist(
    'Little Nightmares',
    'Six',
    'Trapped in the darkest depths of The Maw, starving and alone, Six\'s world is one filled with danger. Most children would have already given up, but Six is different. She\'s smart, and tough, and has a lovely yellow raincoat. She belongs elsewhere.',
    'The Janitor, The Twin Chefs, The Guests, The Lady',
    'The Girl in the Yellow Raincoat, Mono',
    [
      ImageProtagonist(
        'assets/six1.webp',
        const Color(0xffE6F1AE),
      ),
      ImageProtagonist(
        'assets/six2.webp',
        const Color(0xffCBD596),
      ),
      ImageProtagonist(
        'assets/six3.webp',
        const Color(0xffB7C281),
      ),
      ImageProtagonist(
        'assets/six4.webp',
        const Color(0xff9BA568),
      ),
    ],
  ),
  Protagonist(
    'Little Nightmares II',
    'Mono',
    'As the world buckles under the relentless pulse of The Signal Tower, Mono takes refuge where he can. His thin paper mask offers some respite, helping him forget that the world outside hates him, and wants him to fail - but he can\'t stay hidden forever.',
    'The Hunter, The Teacher, The Doctor, The Thin Man',
    'Six',
    [
      ImageProtagonist(
        'assets/mono1.webp',
        const Color(0xff74D1F9),
      ),
      ImageProtagonist(
        'assets/mono2.webp',
        const Color(0xff65C0E7),
      ),
      ImageProtagonist(
        'assets/mono3.webp',
        const Color(0xff50A9CE),
      ),
      ImageProtagonist(
        'assets/mono4.webp',
        const Color(0xff3881A0),
      ),
    ],
  ),
  Protagonist(
    'Little Nightmares III',
    'Low & Alone',
    'Trapped within The Spiral, a cluster of disturbing places, the two friends will have to work together to survive in a dangerous world full of delusions and scape the grasp of an even greater threat lurking in the shadows.',
    'The Monster Baby',
    'Themselves',
    [
      ImageProtagonist(
        'assets/low_alone1.jpg',
        const Color(0xffF8C373),
      ),
      ImageProtagonist(
        'assets/low_alone2.webp',
        const Color(0xffE2A241),
      ),
      ImageProtagonist(
        'assets/low_alone3.webp',
        const Color(0xffC8831B),
      ),
      // ImageProtagonist(
      //   'images/',
      //   const Color(0xff5C9462),
      // ),
    ],
  ),
];

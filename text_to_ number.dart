import 'dart:collection';

main() {
  TextToNumber(
      'наян есөн сая долоон зуун арван дөрвөн мянга хоёр зуун дөчин нэг lskdfj');
}

class TextToNumber {
  TextToNumber(String text) {
    Map<String, int> map = {
      'тэг': 0,
      'нэг': 1,
      'хоёр': 2,
      'гурав': 3,
      'дөрөв': 4,
      'тав': 5,
      'зургаа': 6,
      'долоо': 7,
      'найм': 8,
      'ес': 9,
      'нэгэн': 1,
      'гурван': 3,
      'дөрвөн': 4,
      'таван': 5,
      'зургаан': 6,
      'долоон': 7,
      'найман': 8,
      'есөн': 9,
      'арав': 10,
      'хорь': 20,
      'гуч': 30,
      'дөч': 40,
      'тавь': 50,
      'жар': 60,
      'дал': 70,
      'ная': 80,
      'ер': 90,
      'арван': 10,
      'хорин': 20,
      'гучин': 30,
      'дөчин': 40,
      'тавин': 50,
      'жаран': 60,
      'далан': 70,
      'наян': 80,
      'ерэн': 90,
      'зуу': 100,
      'зуун': 100,
      'мянга': 1000,
      'мянган': 1000,
      'сая': 1000000
    };

    int num = 0;
    int saved_num = 0;
    bool is_prev_num = false;
    final splitted = text.split(' ');
    List<String> result = [];
    for (String word in splitted) {
      // print(word);
      if (!map.containsKey(word)) {
        num += saved_num;
        if (num > 0) {
          if (is_prev_num) {
            result[result.length - 1] =
                result[result.length - 1] + num.toString();
          } else {
            result.add(num.toString());
          }
          num = 0;
          saved_num = 0;
        }
        is_prev_num = false;
        result.add(word);
        continue;
      }

      if (map[word] >= 1000) {
        saved_num = saved_num == 0 ? map[word] : saved_num * map[word];
        num += saved_num;
        saved_num = 0;
      } else {
        if (map[word] == 0) {
          num += saved_num;
          if (num > 0) {
            if (is_prev_num) {
              result[result.length - 1] =
                  result[result.length - 1] + num.toString() + '0';
            } else {
              result.add(num.toString() + '0');
            }
            num = 0;
            saved_num = 0;
            is_prev_num = true;
          }
          continue;
        }
        if (saved_num < 100 &&
            saved_num > 0 &&
            map[word] < 100 &&
            map[word] > 10) {
          num += saved_num;
          if (num > 0) {
            if (is_prev_num) {
              result[result.length - 1] =
                  result[result.length - 1] + num.toString();
            } else {
              result.add(num.toString());
            }
            num = 0;
            saved_num = 0;
            is_prev_num = true;
          }
        }
        if (map[word] >= 100) {
          saved_num = saved_num == 0 ? map[word] : saved_num * map[word];
        } else {
          saved_num += map[word];
        }
      }
    }
    num += saved_num;
    print(result);
  }
}

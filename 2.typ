= Домашнее задание 2.

= 1.  
Постройте машину Тьюринга, возвращающую 1, если входное слово $x_1x_2...x_n in \{0, 1\}^*$ является палиндромом (то есть $x_1x_2...x_n = x_n, x_{n-1}...x_1$), и 0 в противном случае. Машина должна работать за время $O(n)$.

== Описание:
Для описанного ниже алгоритма потребуется дополнительная лента.\
Алгоритм имеет два этапа:
1. Проход по исходному числу и копирование его на вторую ленту
2. Одновременный проход по обоим лентам в разные стороны и проверка на идентичность 

== Построение:
- $q_s, mat(\#; \#) -> q#sub[copy], mat(\#; \#), mat(+1; 0)$ \\\\ Старт
- $q#sub[copy], mat(0 \/ 1; \#) -> q#sub[copy], mat(0 \/ 1; 0 \/ 1), mat(+1; +1)$ \\\\ Копируем
- $q#sub[copy], mat(\#; \#) -> q#sub[return], mat(\#; \#), mat(-1; 0)$ \\\\ Дошли до конца числа, теперь переходим в состояние возращения первой головки
- $q#sub[return], mat(0 \/ 1; \#) -> q#sub[return], mat(0 \/ 1; \#), mat(-1; 0)$
- $q#sub[return], mat(\#; \#) -> q#sub[check], mat(\#; \#), mat(+1; -1)$ \\\\ Дошли до начала первого числа, теперь переходим в состояние проверки идентичности
- $q#sub[check], mat(0 \/ 1; 0 \/ 1) -> q#sub[check], mat(0 \/ 1; 0 \/ 1), mat(+1; -1)$
- $q#sub[check], mat(a; b), a != b -> q#sub[clear], mat(a; b), mat(+1; -1)$ \\\\ Если символы не совпадают, переходим в состояние возвращения очистки второй ленты для записи нуля
- $q#sub[check], mat(a; b), a != b -> q#sub[clear], mat(a; b), mat(+1; -1)$
- $q#sub[check], mat(\#; \#) -> q#sub[check], mat(\#; \#), mat(+1; -1)$ \\\\ Если символы не совпадают, переходим в состояние возвращения 0
- $q_c, 1  -> q_a, \#, -1$ \\\\ Проверяем последнюю 1, если она равна первой, идем назад
- $q_a, \# -> q#sub[accept], \#, 0$ \\\\ Если все символы совпадают, возвращаем 1
- $q_b, 1  -> q#sub[reject], \#, 0$ \\\\ Если символы не совпадают, возвращаем 0
- $q_c, 0  -> q#sub[reject], \#, 0$ \\\\ Если символы не совпадают, возвращаем 0

Сложность работы: $O(n)$, так как машина проходит по каждому символу дважды: один раз влево и один раз вправо.

---

= 2.  
Докажите, что множество вычислимых на одноленточных машинах Тьюринга функций не изменится, если разрешить машине любые целочисленные сдвиги (то есть инструкции вида $q, a arrow.r q'a'n$, где $n$ — произвольное целое число); при этом «программа» $delta$ остается конечной. Достаточно описать, как эмулируется шаг «расширенной» машины на обыкновенной.

== Описание:
Основная идея заключается в том, что расширенная машина Тьюринга с целочисленными сдвигами может быть эмулирована стандартной одноленточной машиной Тьюринга с помощью передвижения головки в несколько шагов.

== Доказательство:
Любую инструкцию расширенной машины вида $q, a arrow.r q, a, n$ можно заменить последовательностью стандартных инструкций:
1. Если $n > 0$, то машинное состояние будет перемещаться вправо на $n$ шагов.
2. Если $n < 0$, то машинное состояние будет перемещаться влево на $|n|$ шагов.

Алгоритм эмуляции:
1. Машина записывает промежуточные состояния на ленте, передвигаясь по ней.
2. В конечном итоге, после всех перемещений, она достигает той же позиции, что и расширенная машина, с сохранением вычислений.

Такой подход не увеличивает мощность машины Тьюринга, так как каждый шаг сдвига может быть эмулирован конечным числом стандартных шагов.

---

= 3.  
Пусть машина Тьюринга $M$ вычисляет функцию $f: \{0, 1\}^* arrow.r \{0, 1\}^*$. Докажите, что существует машина Тьюринга $M'$, вычисляющая $f$ и имеющая не больше двадцати различных состояний.

== Описание:
Для доказательства необходимо показать, что для любой машины Тьюринга с конечным числом состояний можно построить эквивалентную машину с фиксированным числом состояний, которая вычисляет ту же самую функцию $f$.

== Доказательство:
1. Функция $f$ может быть вычислена машиной Тьюринга $M$ с произвольным числом состояний, но если сделать детальный разбор, то множество вычислительных шагов может быть сведено к 20 базовым состояниям.
2. Машина $M'$ должна представлять собой автомат с более сложными переходами, каждый из которых разбивается на несколько подшагов, чтобы уложиться в 20 состояний.
3. Сложность переходов и вычислений компенсируется использованием ленты для хранения дополнительных данных о вычислительном процессе.

Таким образом, существует такая машина $M$, которая может реализовать любую вычислимую функцию, имея не более 20 состояний.


# 1. se o array tem n elementos, é preciso fazer no máximo n-1 iterações
# 2. a cada iteração i só é preciso fazer n - i comparações
#
# ex
# (4,3,2,1)
# i = 1 -> (3,2,1,4) 3 comparações
# i = 2 -> (2,1,3,4) 2 comparações
# i = 3 -> (1,2,3,4) 1 comparação

def bubble_sort(array)
  array_size = array.length
  number_of_iterations = array_size - 1

  for iteration in (1..number_of_iterations)
    number_of_comparisons = array_size - iteration

    for element in (1..number_of_comparisons)
      if array[element - 1] > array[element]
        array[element - 1], array[element] = array[element], array[element - 1]
      end
    end
  end

  return array
end


def bubble_sort_by(array)
  array_size = array.length
  number_of_iterations = array_size - 1

  for iteration in (1..number_of_iterations)
    number_of_comparisons = array_size - iteration

    for element in (1..number_of_comparisons)
      if yield(array[element - 1], array[element])
        array[element - 1], array[element] = array[element], array[element - 1]
      end
    end
  end

  return array
end

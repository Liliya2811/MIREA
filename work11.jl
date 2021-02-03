#=ДАНО: Робот - в произвольной клетке, где-то между внутренними перегородкаи прямоугольной формы и 
внешней рамкой поля (прямоугольники могут быть и вырожденными, т.е. представлять собой отрезки)
РЕЗУЛЬТАТ: Робот - в исходном положении и в 4-х приграничных клетках, 
2-е из которых имеют ту же широту, а 2-е - ту же долготу, что и Робот, стоят маркеры.=#
function mark_centers(r)
    num_steps = through_rectangles_into_angle(r,(Sud,West))
    num_steps_to_ost = sum(num_steps[1:2:end])
    num_steps_to_nord = sum(num_steps[2:2:end])

   
    movements!(r,Nord,num_steps_to_nord)
    putmarker!(r)
    num_steps_to_sud = movements!(r,Nord)

    movements!(r,Ost,num_steps_to_ost)
    putmarker!(r)
    num_steps_to_west = movements!(r,Ost)

    movements!(r,Sud,num_steps_to_sud)
    putmarker!(r)
    movements!(r,Sud) 

    movements!(r,Sud,num_steps_to_west)
    putmarker!(r)
    movements!(r,Sud) 

    movements!(r,(Ost,Nord),num_steps)
    
end
function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
    num_steps=[]
    while isborder(r,angle[1])==false || isborder(r,angle[2])
        push!(num_steps, movements!(r, angle[2]))
        push!(num_steps, movements!(r, angle[1]))
    end
    return num_steps
end
function movements!(r,sides,num_steps::Vector{Int})
    for (i,n) in enumerate(num_steps)
        movements!(r, sides[mod(i-1, length(sides))+1], n)
    end
end
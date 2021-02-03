#=ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля 
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы 

function 
    перейти в самый левый нижний угол и маркировать все змейкой
end=#

function all_mark!(r::Robot)
    x= moves!(r, West)
    y= moves!(r, Nord)
    move_angle_left!(r)
    hight= moves!(r, Nord)
    move_angle_left!(r)
    move_square!(r, hight)
    spawn!(r, x, y)
end

function move_angle_left!(r::Robot) #перемещает в левый нижний угол
    for side in (Sud, West)
        while isborder(r, side) == false
            move!(r, side)
        end
    end
end

function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2, 4))
end

function back!(r::Robot)
    while isborder(r,West) == false
        move!(r,West)
    end
end

function move_square!(r::Robot, hight::Int)
    for i in 0:hight
        while isborder(r, Ost) == false
            putmarker!(r)
            move!(r, Ost)
        end
        putmarker!(r)
        if(isborder(r,Nord)==false)
            move!(r,Nord)
        end
        back!(r)
    end
end

function spawn!(r::Robot, x::Int, y::Int)
    for i in 1:x
        move!(r, Ost)
    end
    for i in 1:y
        move!(r, Sud)
    end
end
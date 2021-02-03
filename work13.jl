function tr13!(r::Robot)
    SUD_ost(r)
    sud_west(r)
    nord_west(r)
    ost_nord(r)
    putmarker!(r)
end
function SUD_ost(r::Robot)#
    while isborder(r, Nord) == false
        if isborder(r, Sud) == false
            if isborder(r, Ost) == false
                move!(r, Ost)
                move!(r, Sud)
                putmarker!(r)
            else
                break
            end
        else
            break
        end
    end 
    for i in 1:100
        move!(r, Nord)
        move!(r, West)
        if ismarker(r) == false
            break
        end
    end
end
function sud_west(r::Robot)
    while isborder(r, Nord) == false
        if isborder(r, Sud) == false
            if isborder(r, West) == false
                move!(r, West)
                move!(r, Sud)
                putmarker!(r)
            else
                break
            end
        else
            break
        end
    end 
    for i in 1:100
        move!(r, Nord)
        move!(r, Ost)
        if ismarker(r) == false
            break
        end
    end
end
function nord_west(r::Robot)
    while isborder(r, Sud) == false
        if isborder(r, Nord) == false
            if isborder(r, West) == false
                move!(r, West)
                move!(r, Nord)
                putmarker!(r)
            else
                break
            end
        else
            break
        end
    end 
    
    for i in 1:100
        move!(r, Sud)
        move!(r, Ost)
        if ismarker(r) == false
            break
        end
    end
end
function ost_nord(r::Robot)
    while isborder(r, Sud) == false
        if isborder(r, Nord) == false
            if isborder(r, Ost) == false
                move!(r, Ost)
                move!(r, Nord)
                putmarker!(r)
            else
                break
            end
        else
            break
        end
    end 
    
    for i in 1:100
        move!(r, Sud)
        move!(r, West)
        if ismarker(r) == false
            break
        end
    end
end
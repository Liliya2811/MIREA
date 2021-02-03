function tr9!(r::Robot)
    num_steps_max=1
    side=Nord
    while ismarker(r)==false
        for _ in 1:2
            for _ in 1:num_steps_max
                if ismarker(r)
                    return nothing
                end
                move!(r,side)
            end
            side=HorizonSide(mod(Int(side)+1,4))

        end
        num_steps_max+=1
    end
end
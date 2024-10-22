local function vim_mode(key, env)
    -- 如果当前是win, 且按下了ctrl+[
    if key:repr() == "Escape" then
        -- 检测当前是不是英文模式(其实是为了减少在win下那个 中/A 的弹窗次数)
        local get_ascii_mode = env.engine.context:get_option("ascii_mode")
        -- 如果不是英文模式, 就切换到英文模式
        if not get_ascii_mode then
            env.engine.context:set_option("ascii_mode", true)
            --disable_capslock();
        end
        -- 因为前面的ctrl+[ 被接管了, 所有需要发送一个ctrl+[ 给vim, 使其到normal模式
        env.engine.commit_text("Escape")
        return 1
    end
    return 2
end
return vim_mode
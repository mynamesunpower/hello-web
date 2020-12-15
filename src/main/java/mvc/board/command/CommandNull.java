package mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandNull implements Command{
    private String nextPage;

    public CommandNull (String nextPage) {
        this.nextPage = nextPage;
    }

    public String execute(HttpServletRequest request, HttpServletResponse response){
        return nextPage;
    }
}

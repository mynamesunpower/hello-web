package mvc.board.command;

public class CommandException extends Exception {
    public CommandException(){
        super();
    }

    public CommandException(String err){
        super(err);
    }
}

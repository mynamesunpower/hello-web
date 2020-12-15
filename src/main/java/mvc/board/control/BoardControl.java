package mvc.board.control;

import mvc.board.command.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class BoardControl extends HttpServlet {

    // HashMap 형태의 자료구조에 명령어를 하나하나 저장해두는 느낌이라고 생각했당
    private HashMap commandMap;

    // 인텔리J가 자꾸 final로 선언하래서 바꿈. 이유 모름
    // 나중에 알면 여기 추가 ---->
    private final String jspDir = "/back_end/mvc_board/";
    private final String error = "error.jsp";

    public BoardControl() {
        super(); // BoardControl은 서블릿 그 자체!
        initCommand(); // 자꾸 커맨드가 늘어나면 더럽자나. 그래서 쪼갠거겠지
    }

    private void initCommand(){
        commandMap = new HashMap();
        // ↓ 메인 페이지욧 ↓
        commandMap.put("main-page", new CommandNull("main.jsp"));
        // ↓ 목록 페이지 ↓
        commandMap.put("list-page", new CommandList("BoardList.jsp"));
        // ↓ 글 상세보기 ↓
        commandMap.put("view-page", new CommandView("BoardView.jsp"));
        // ↓ 글쓰기 (폼 페이지 -> 글쓰기 작업하는 페이지) ↓
        commandMap.put("write-form", new CommandNull("BoardInputForm.jsp"));
        commandMap.put("write-save", new CommandWrite("BoardSave.jsp"));
        // ↓ 수정하기 (수정 폼 페이지 -> 수정 작업하는 페이지) ↓
        commandMap.put("modify-form", new CommandView("BoardModifyForm.jsp")); // commandView에서는 article 저장가능
        commandMap.put("modify-save", new CommandModify("BoardModify.jsp"));
        // ↓ 삭제하기 (비번 묻는 페이지 -> 삭제 작업하는 페이지) ↓
        commandMap.put("delete-form", new CommandNull("BoardDeleteForm.jsp"));
        commandMap.put("delete-save", new CommandDelete("BoardDelete.jsp"));
        // ↓ 답변하기 (답변 쓰는 페이지 -> 답변 작업하는 페이지) ↓
        commandMap.put("reply-form", new CommandNull("BoardReplyForm.jsp"));
        commandMap.put("reply-save", new CommandReply("BoardReply.jsp"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    } // 일단 doPost나 doGet으로 날아오지만 모조리 processRequest로 보낸다.

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");

        String nextPage = "";
        String cmdKey = request.getParameter("cmd");
        if (cmdKey == null) cmdKey = "main-page";

        Command command = null;
        try {
            if (commandMap.containsKey(cmdKey)) {
                command = (Command)commandMap.get(cmdKey);
            } else {
                throw new CommandException("지정할 명령어가 존재하지 않음");
            }

            nextPage = command.execute(request, response);

        } catch (CommandException e) {
            request.setAttribute("javax.servlet.jsp.jspException", e);
            nextPage = error;
            System.out.println("오류: " + e.toString());
        }

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(jspDir + nextPage);
        requestDispatcher.forward(request, response);
    }
}

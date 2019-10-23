package vo;


public class PageVO {
	private int currPage;   // 출력할 현재 Page
	private int perPage=15;  // 1page 당 출력 갯수
	private int totalCount; // total Record 갯수
	private int perPageNo=3; // 한 화면에 출력되는 pageNo 갯수
	private int sno; // start rownum
	private String search;  

	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}



	public int getPerPageNo() {
		return perPageNo;
	}

	public void setPerPageNo(int perPageNo) {
		this.perPageNo = perPageNo;
	}


	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "PageVO [currPage=" + currPage + ", perPage=" + perPage + ", totalCount=" + totalCount + ", perPageNo="
				+ perPageNo + ", sno=" + sno + ", search=" + search + "]";
	}




}

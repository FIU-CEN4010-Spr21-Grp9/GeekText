package GeekTextRest.restservice;

public class GeekTextRest {

	private final long id;
	private final String content;

	public GeekTextRest(long id, String content) {
		this.id = id;
		this.content = content;
	}

	public long getId() {
		return id;
	}

	public String getContent() {
		return content;
	}
}

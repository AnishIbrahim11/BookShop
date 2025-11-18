# 🗺️ BookHub Application Map

## URL Structure

```
http://localhost:8080/BookHub/
│
├── /                              → Redirects to /books/
│
└── /books/
    ├── /                          → Home Page (home.jsp)
    │                                 - Welcome screen
    │                                 - "Add New Book" button
    │                                 - "View All Books" button
    │
    ├── /addBook                   → Add Book Page (addBook.jsp)
    │                                 - Form with Title, Author, Price
    │                                 - Save button → POST to /saveBook
    │                                 - Cancel button → Back to /viewBooks
    │
    ├── /saveBook                  → Save Book Handler (POST)
    │                                 - Processes form submission
    │                                 - Saves to database via DAO
    │                                 - Redirects to /viewBooks
    │
    └── /viewBooks                 → View Books Page (viewBooks.jsp)
                                      - Table with all books
                                      - Columns: ID, Title, Author, Price
                                      - "Add New Book" button
                                      - "Home" button
```

## Page Flow

```
┌─────────────────┐
│   index.jsp     │
│  (Redirect)     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   home.jsp      │◄──────────────────┐
│  (Landing)      │                   │
└────┬───────┬────┘                   │
     │       │                        │
     │       └──────────┐             │
     │                  │             │
     ▼                  ▼             │
┌──────────┐      ┌──────────┐       │
│addBook.  │      │viewBooks │       │
│jsp       │      │.jsp      │       │
│          │      │          │       │
└────┬─────┘      └────┬─────┘       │
     │                 │              │
     │ (Save)          │              │
     ▼                 │              │
┌──────────┐           │              │
│/saveBook │           │              │
│(POST)    │───────────┘              │
└──────────┘                          │
     │                                │
     └────────────────────────────────┘
```

## Database Flow

```
User Request
    │
    ▼
┌───────────────┐
│ BookController│
│  (@Controller)│
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   BookDAO     │
│ (Interface)   │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│ BookDAOImpl   │
│(@Repository)  │
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   Hibernate   │
│ SessionFactory│
└───────┬───────┘
        │
        ▼
┌───────────────┐
│ MySQL Database│
│  bookhub_db   │
└───────────────┘
```

## Spring Configuration Flow

```
Application Startup
    │
    ▼
┌──────────────────┐
│    web.xml       │ ← Web Application Descriptor
│                  │   - Configures DispatcherServlet
│                  │   - Loads applicationContext.xml
└────────┬─────────┘
         │
         ├─────────────────┐
         │                 │
         ▼                 ▼
┌──────────────┐   ┌──────────────────┐
│dispatcher-   │   │applicationContext│
│servlet.xml   │   │.xml              │
│              │   │                  │
│- Controllers │   │- DAOs            │
│- View Resolver   │- Hibernate       │
│- Static Resources│- DataSource      │
│              │   │- Transactions    │
└──────────────┘   └──────────────────┘
         │                 │
         └────────┬────────┘
                  │
                  ▼
         ┌────────────────┐
         │ Spring Context │
         │   Container    │
         └────────────────┘
```

## Component Dependency Graph

```
┌──────────────────────────────────────────┐
│              Web Layer                   │
│  ┌─────────────────────────────────┐   │
│  │       JSP Views                 │   │
│  │  home.jsp | addBook.jsp |       │   │
│  │  viewBooks.jsp                  │   │
│  └─────────────────────────────────┘   │
└──────────────────┬───────────────────────┘
                   │
                   ▼
┌──────────────────────────────────────────┐
│           Controller Layer               │
│  ┌─────────────────────────────────┐   │
│  │      BookController             │   │
│  │    @Controller                  │   │
│  │    @RequestMapping              │   │
│  └─────────────────────────────────┘   │
└──────────────────┬───────────────────────┘
                   │ @Autowired
                   ▼
┌──────────────────────────────────────────┐
│             DAO Layer                    │
│  ┌─────────────────────────────────┐   │
│  │      BookDAO (Interface)        │   │
│  └─────────────────────────────────┘   │
│  ┌─────────────────────────────────┐   │
│  │      BookDAOImpl                │   │
│  │    @Repository                  │   │
│  │    @Transactional               │   │
│  └─────────────────────────────────┘   │
└──────────────────┬───────────────────────┘
                   │ uses
                   ▼
┌──────────────────────────────────────────┐
│           Entity Layer                   │
│  ┌─────────────────────────────────┐   │
│  │        Book                     │   │
│  │      @Entity                    │   │
│  │      @Table("books")            │   │
│  └─────────────────────────────────┘   │
└──────────────────┬───────────────────────┘
                   │
                   ▼
┌──────────────────────────────────────────┐
│          Database Layer                  │
│  ┌─────────────────────────────────┐   │
│  │    MySQL Database               │   │
│  │    bookhub_db.books             │   │
│  └─────────────────────────────────┘   │
└──────────────────────────────────────────┘
```

## File Organization

```
BookHub/
├── Configuration Files
│   ├── pom.xml                     → Maven dependencies & build
│   ├── .gitignore                  → Git exclusions
│   └── src/main/resources/
│       └── database.properties     → DB credentials
│
├── Java Source Code
│   └── src/main/java/com/bookhub/
│       ├── entity/
│       │   └── Book.java           → Entity class
│       ├── dao/
│       │   ├── BookDAO.java        → DAO interface
│       │   └── BookDAOImpl.java    → DAO implementation
│       └── controller/
│           └── BookController.java → MVC controller
│
├── Web Resources
│   └── src/main/webapp/
│       ├── WEB-INF/
│       │   ├── views/
│       │   │   ├── home.jsp        → Landing page
│       │   │   ├── addBook.jsp     → Add book form
│       │   │   └── viewBooks.jsp   → Books list
│       │   ├── web.xml             → Web app descriptor
│       │   ├── dispatcher-servlet.xml → Spring MVC config
│       │   └── applicationContext.xml → Spring+Hibernate config
│       └── index.jsp               → Entry point
│
└── Documentation
    ├── README.md                   → Complete guide
    ├── QUICKSTART.md               → Quick setup
    ├── IMPLEMENTATION_SUMMARY.md   → Technical details
    └── database-setup.sql          → DB setup script
```

## Key Annotations Used

### Entity Layer
- `@Entity` - Marks class as JPA entity
- `@Table(name="books")` - Maps to database table
- `@Id` - Primary key field
- `@GeneratedValue` - Auto-increment strategy
- `@Column` - Column mappings

### DAO Layer
- `@Repository` - Spring Data Access component
- `@Transactional` - Transaction management
- `@Autowired` - Dependency injection

### Controller Layer
- `@Controller` - Spring MVC controller
- `@RequestMapping` - URL mapping
- `@GetMapping` - HTTP GET handler
- `@PostMapping` - HTTP POST handler
- `@ModelAttribute` - Form binding

## Data Flow Example: Adding a Book

```
1. User clicks "Add New Book" button
   └→ GET /books/addBook
   
2. BookController.showAddBookForm()
   └→ Creates empty Book object
   └→ Adds to Model
   └→ Returns "addBook" view name
   
3. Spring ViewResolver
   └→ Resolves to /WEB-INF/views/addBook.jsp
   
4. User fills form and clicks "Save"
   └→ POST /books/saveBook
   
5. BookController.saveBook(@ModelAttribute Book)
   └→ Spring binds form data to Book object
   └→ Calls bookDAO.saveBook(book)
   
6. BookDAOImpl.saveBook(book)
   └→ Gets Hibernate session
   └→ session.save(book)
   └→ Transaction commits
   
7. MySQL Database
   └→ INSERT INTO books (title, author, price) VALUES (...)
   
8. Controller redirects
   └→ "redirect:/books/viewBooks"
   
9. User sees updated book list
```

## Technologies Integration Points

```
Spring MVC ←→ Hibernate ←→ MySQL
    ↓            ↓
JSP Views    Spring TX
    ↓            ↓
JSTL Tags    DBCP2 Pool
```

This map shows the complete structure and flow of the BookHub application! 🗺️✨

class AppConstants {
  static const String appName = 'Luxury CRM Enterprise';
  static const String appVersion = '1.0.0';
  static const String companyName = 'Luxury Restaurant Group';

  // API Endpoints
  static const String baseUrl = 'https://api.luxury-crm.com';
  static const String apiVersion = 'v1';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String organizationsCollection = 'organizations';
  static const String visitsCollection = 'visits';
  static const String proposalsCollection = 'proposals';
  static const String tasksCollection = 'tasks';
  static const String eventsCollection = 'events';
  static const String contractsCollection = 'contracts';
  static const String ticketsCollection = 'tickets';
  static const String documentsCollection = 'documents';
  static const String auditLogsCollection = 'audit_logs';
  static const String haccpRecordsCollection = 'haccp_records';
  static const String isoRecordsCollection = 'iso_records';

  // User Roles
  static const String roleAdmin = 'admin';
  static const String roleExternalManager = 'external_manager';
  static const String roleExternalOfficer = 'external_officer';
  static const String roleCustomerService = 'customer_service';
  static const String roleQualityManager = 'quality_manager';
  static const String roleFinanceManager = 'finance_manager';

  // Task Types
  static const String taskVisit = 'visit';
  static const String taskCall = 'call';
  static const String taskMeeting = 'meeting';
  static const String taskFollowUp = 'follow_up';
  static const String taskCollection = 'collection';
  static const String taskEvent = 'event';

  // Task Status
  static const String statusNew = 'new';
  static const String statusInProgress = 'in_progress';
  static const String statusPending = 'pending';
  static const String statusCompleted = 'completed';
  static const String statusCancelled = 'cancelled';

  // Pipeline Stages
  static const String stageLead = 'lead';
  static const String stageQualified = 'qualified';
  static const String stageMeeting = 'meeting';
  static const String stageProposal = 'proposal';
  static const String stageNegotiation = 'negotiation';
  static const String stageContract = 'contract';
  static const String stageWon = 'won';
  static const String stageLost = 'lost';

  // Contract Types
  static const String contractSupply = 'supply';
  static const String contractEvent = 'event';
  static const String contractSubscription = 'subscription';
  static const String contractEmployeeDiscount = 'employee_discount';

  // Event Types
  static const String eventConference = 'conference';
  static const String eventExhibition = 'exhibition';
  static const String eventParty = 'party';
  static const String eventOfficialMeeting = 'official_meeting';
  static const String eventWorkshop = 'workshop';
  static const String eventCorporate = 'corporate';

  // Payment Methods
  static const String paymentCash = 'cash';
  static const String paymentBankTransfer = 'bank_transfer';
  static const String paymentCheck = 'check';
  static const String paymentCredit = 'credit';
  static const String paymentInstallments = 'installments';

  // Service Types
  static const String serviceBuffet = 'buffet';
  static const String serviceHospitality = 'hospitality';
  static const String serviceEvents = 'events';
  static const String serviceSubscription = 'subscription';

  // Need Types
  static const String needMealBoxes = 'meal_boxes';
  static const String needMeetingHospitality = 'meeting_hospitality';
  static const String needEvents = 'events';
  static const String needCatering = 'catering';
  static const String needCoffee = 'coffee';
  static const String needEmployeeMeals = 'employee_meals';
  static const String needVIP = 'vip';
  static const String needSeasonal = 'seasonal';

  // Priority Levels
  static const String priorityUrgent = 'urgent';
  static const String priorityNormal = 'normal';
  static const String priorityLater = 'later';

  // Customer Status
  static const String customerInterested = 'interested';
  static const String customerFollowing = 'following';
  static const String customerNotInterested = 'not_interested';

  // Opportunity Size
  static const String sizeSmall = 'small';
  static const String sizeMedium = 'medium';
  static const String sizeLarge = 'large';

  // Contract Probability
  static const String probLow = 'low';
  static const String probMedium = 'medium';
  static const String probHigh = 'high';

  // Ticket Priority
  static const String ticketLow = 'low';
  static const String ticketMedium = 'medium';
  static const String ticketHigh = 'high';
  static const String ticketCritical = 'critical';

  // Ticket Status
  static const String ticketOpen = 'open';
  static const String ticketInProgress = 'in_progress';
  static const String ticketResolved = 'resolved';
  static const String ticketClosed = 'closed';

  // Satisfaction Rating
  static const String ratingExcellent = 'excellent';
  static const String ratingGood = 'good';
  static const String ratingAcceptable = 'acceptable';
  static const String ratingPoor = 'poor';

  // Time Compliance
  static const String timeExcellent = 'excellent';
  static const String timeGood = 'good';
  static const String timePoor = 'poor';

  // Document Types
  static const String docContract = 'contract';
  static const String docProposal = 'proposal';
  static const String docInvoice = 'invoice';
  static const String docISO = 'iso_certificate';
  static const String docHACCP = 'haccp_certificate';
  static const String docReport = 'report';

  // Colors
  static const int colorPrimary = 0xFF1A1A2E;
  static const int colorSecondary = 0xFFE94560;
  static const int colorTertiary = 0xFF0F3460;
  static const int colorSuccess = 0xFF28A745;
  static const int colorWarning = 0xFFFFC107;
  static const int colorDanger = 0xFFDC3545;
  static const int colorInfo = 0xFF17A2B8;
  static const int colorLight = 0xFFF8F9FA;
  static const int colorDark = 0xFF343A40;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // File Upload
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  static const List<String> allowedDocumentTypes = ['pdf', 'doc', 'docx', 'xls', 'xlsx'];

  // Cache Duration
  static const Duration cacheDuration = Duration(hours: 24);
  static const Duration tokenExpiry = Duration(days: 7);

  // Notification Channels
  static const String channelGeneral = 'general';
  static const String channelTasks = 'tasks';
  static const String channelApprovals = 'approvals';
  static const String channelReminders = 'reminders';

  // Google Integration
  static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
  static const String googleCalendarApiKey = 'YOUR_GOOGLE_CALENDAR_API_KEY';
  static const String googleDriveApiKey = 'YOUR_GOOGLE_DRIVE_API_KEY';

  // Power BI
  static const String powerBIReportUrl = 'YOUR_POWER_BI_REPORT_URL';

  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';
  static const String displayDateFormat = 'dd MMMM yyyy';
  static const String displayDateTimeFormat = 'dd MMMM yyyy - HH:mm';

  // Currency
  static const String currencySymbol = 'ر.س';
  static const String currencyCode = 'SAR';

  // Tax
  static const double vatRate = 0.15; // 15% VAT Saudi Arabia

  // Limits
  static const int maxUploadFiles = 10;
  static const int maxTeamMembers = 10;
  static const int maxBranches = 50;

  // Session
  static const int sessionTimeoutMinutes = 30;
  static const int maxLoginAttempts = 5;
  static const int lockoutDurationMinutes = 30;
}
